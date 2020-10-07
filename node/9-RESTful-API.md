# **RESTful API**

## Introduction

RESTful API = REpresentational State Transfer Application Programming Interface
Le point à retenir est qu'une api REST offre un service à un client qui l'interroge. Ce service est accessible via les méthodes HTTP qui par convention correspondent à :

- `GET` pour récupérer des informations depuis le serveur.
- `POST` pour créer des informations sur le serveur.
- `PUT` pour mettre à jour / remplacer une information sur le serveur.
- `PATCH`pour mettre à jour /modifier une information sur le serveur.
- `DELETE` pour effacer une information sur le serveur.

Ces requêtes HTTP sont effectuées sur une URL, et des paramètres sont passés à cette URL, dans l'URL directement ou le body de la requête avec des données au format JSON (c'est le cas de POST).
Suite à la réception de la requête, sont extraits les paramètres de la requête sur le serveur de l'api REST. Il est peut être alors nécéssaire d'effectuer des tâches ou de récupérer/modifier/supprimer des données en fonction de la requête.
Si les informations sont stockés sur une base de données le serveur de l'api REST accèdera à la base et y effectuera les requêtes SQL nécessaires.
Dans notre cas le serveur de l'api REST est un serveur express et la base de données fonctionne sur un serveur Postgresql.

## Fonctionnement

On peut identifier 3 fonctions que devra effectuer une api REST :

- Récupérer les requêtes et les paramètres de ces requêtes. C'est l'interface de notre api. Il y a autant de routes/endpoint que de de fonctionnalités
- Communiquer avec la base de données depuis notre serveur express. Il faut que la requête, si elle est valide, déclenche une connexion à une base de données pour effectuer le traitement nécéssaire. Le traitement sur la base de données dépendra de la requête et des paramètres. Pour communiquer avec une base de données on utilise un package node.js.
- Effectuer le traitement de la requêtes SQL sur notre serveur Postgresql et retourner le résultat de l'opération.

## Create a REST api

Dans les cours précédent nous avons vu comment créer un serveur express qui gère les requêtes HTTP sur une interface défini par des routes.
Nous avons également vu comment créer une base de données et exécuter des requêtes SQL.  
Dans ce cours nous allons apprendre comment communiquer entre notre serveur express et notre base de données Postgresql.  
Pour cela nous allons utiliser l'ORM `Sequelize`.

### Sequelize introduction

documentation officielle: https://sequelize.org/master/manual/getting-started.html

`Sequelize` est un _Object-relational mapping_. C'est un package node.js.  
Ce qu'il faut retenir c'est qu'un ORM est une couche d'abstraction entre notre code javascript et la base de données que l'on souhaite interroger.
Ainsi un ORM nous permet d'interroger une base de données depuis son API, au lieu d'effectuer des raw queries depuis notre code javascript.  
Nous pourrions interroger une base de données depuis `pg` qui est un package node.js. C'est un client javascript Postgresql. Nous effectuerions ainsi des requêtes SQL depuis du code javascript et il n'y aurait pas vraiment de correspondances entre notre code javascript et le résultat de nos requêtes SQL. Nous recevrions les résultats de nos requêtes comme de simples lignes correspondant au résultat de nos requêtes SQL.  
En revanche avec `Sequelize` nous pouvons définir une correspondance entre des objets Javascript et les tables de notre base de données. Nous nous retrouvons à travailler avec des objets en javascript qui correspondent à des tables de notre base de données ou aux résultats de nos requêtes.
Avec `Sequelize` nous ne retournons plus de simples lignes depuis notre base de données, mais des objets que l'on peut directement manipuler côté javascript.
De plus avec `Sequelize` nous bénéficions d'une plus grande modularité, et le code que nous définissons pour interroger une base de donnée Postgresql, peut fonctionner avec une autre base SQL (avec un minimum de modification). L'équivalent d'un `SELECT` effectué depuis `Sequelize` vers une base de données Postgresql fonctionnera aussi sur une base de donnée SQLite ou MySQL.

### first-rest-api project setup

```zsh
% npx djinit first-rest-api
% cd first-rest-api
% yarn add express body-parser sequelize pg pg-hstore
% psql -d postgres -U db_user
postgres=> CREATE DATABASE db_api1;
postgres=> \q
```

### Create Sequelize instance

Testons une connexion à la base de donnée pour avoir un petit aperçu de `Sequelize`.

_authentificate.js_:

```js
import Sequelize from 'sequelize'

const sequelize = new Sequelize('db_api1', 'db_user', 'strongpassword123', {
  host: 'localhost',
  port: 5432,
  dialect: 'postgres',
  define: {
    //prevent sequelize from pluralizing table names
    freezeTableName: true,
    // prevent sequelize from adding timestamps column in tables
    //timestamps: false,
  },
  //logging: false,
})

try {
  await sequelize.authenticate()
  console.log('Connection has been established successfully.')
} catch (error) {
  console.error('Unable to connect to the database:', error)
}
```

### Models

Les modèles sont les objets javascript qui correspondent aux tables de notre base de données.  
Si dans notre base de données nous avons une table `users` alors un modèle `User` dans notre code javascript fait sens. Idem pour une tables `messages`, nous créerions dans ce cas un modèle `Message`.

Créons nos modèles dans le répertoire `src/modes` :

```zsh
% mkdir src/models
```

Dans `src/models` créons un fichier _user.js_. qui déclare une fonction retournant un modèle `User`.

_user.js_:

```js
import DataTypes from 'sequelize'
export default (sequelize) => {
  const User = sequelize.define('users', {
    //users est le nom de la table
    id: {
      // colonne id
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    username: {
      // colonne username
      type: DataTypes.STRING(20),
      unique: true,
      allowNull: false,
    },
    email: {
      // colonne email
      type: DataTypes.STRING(30),
      unique: true,
      allowNull: false,
    },
    api_key: {
      // colonne api_key
      type: DataTypes.UUID,
      unique: true,
      defaultValue: DataTypes.UUIDV1,
    },
    active: {
      // est ce que la l'api_key est toujours valide
      type: DataTypes.BOOLEAN,
      defaultValue: true,
    },
  })

  return User
}
```

Dans `src/models` créons un fichier _message.js_. qui déclare une fonction retournant un modèle `Message`.

_message.js_:

```js
import DataTypes from 'sequelize'
export default (sequelize) => {
  const Message = sequelize.define('messages', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    src: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    dst: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },

    content: {
      type: DataTypes.TEXT,
      defaultValue: true,
    },
  })

  return Message
}
```

### sequelize connector

Dans le répertoire `src/models` créons un fichier _db.js_ qui exportera un connecteur `sequelize` et les modèles `User` et `Message`.

```js
import Sequelize from 'sequelize'
import message from './message.js'
import user from './user.js'

export const sequelize = new Sequelize(
  'db_api1',
  'db_user',
  'strongpassword123',
  {
    host: 'localhost',
    port: 5432,
    dialect: 'postgres',
    define: {
      //prevent sequelize from pluralizing table names
      freezeTableName: true,
      // prevent sequelize from adding timestamps column in tables
      //timestamps: false,
    },
    //logging: false,
  }
)

export const User = user(sequelize)
export const Message = message(sequelize)
```

### REST api interface

La dernière étape est de définir notre serveur express.
Dans le répertoire `src` créons un fichier _api-server.js_

_api-server.js_

```js
import express from 'express'
import bodyParser from 'body-parser'

// import sequelize connector and User and Message models instances
import { sequelize, User, Message } from './models/db.js'

// Test if database connection is OK else exit
try {
  await sequelize.authenticate() // try to authentificate on the database
  console.log('Connection has been established successfully.')
  await User.sync({ alter: true }) // modify users table schema is something changed
  await Message.sync({ alter: true }) // same for messages table
} catch (error) {
  console.error('Unable to connect to the database:', error)
  process.exit(1)
}

// Local network configuration
const IP = '192.168.0.11'
const PORT = 7777

const app = express()

// A middle for checking if an api key is provided by the user
// in the Authorization header
const getApiKey = async (req, res, next) => {
  const key = req.headers.authorization
  if (!key) {
    res.status(403).json({ code: 403, data: 'No api token' })
  } else {
    next()
  }
}

// A middleware for checking if an api token is valid
// and is still active.
// if Ok the user performing the request is attached to the req object.
const validateApiKey = async (req, res, next) => {
  const key = req.headers.authorization
  try {
    const user = await User.findAll({
      attributes: ['username', 'email'],
      where: { api_key: key },
    })
    // check if empty results then not found
    if (user.length === 0) {
      res.status(403).json({ code: 403, data: 'Invalid api token' })
    } else {
      console.log('USER:', user)
      req.user = user
      next()
    }
  } catch (e) {
    res.status(500).json({ code: 500, data: 'Internal server error' })
  }
}

app.use(bodyParser.json()) // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({ extended: false })) // to support URL-encoded bodies

/*
Endpoint for user registration. 
input:
{
    "username": string,
    "email": string
}
*/
app.post('/register', async (req, res) => {
  //check username n'et pas null, pareil pour email
  const username = req.body.username
  const email = req.body.email
  try {
    const user = await User.create({ username: username, email: email })
    res.json({ code: 200, data: user })
  } catch (e) {
    console.log('Error', e)
    res.status(500).json({ code: 500, data: 'Internal server error' })
  }
})

app.use(getApiKey)
app.use(validateApiKey)

// GET user by id
app.get('/id/:id', async (req, res) => {
  const id = req.params.id
  try {
    const user = await User.findAll({
      attributes: ['username', 'email'],
      where: { id: id },
    })
    if (user.length === 0) {
      res.status(404).json({ code: 404, data: 'user not found' })
    } else {
      res.json({ code: 200, data: user })
    }
  } catch (e) {
    res.status(500).json({ code: 500, data: 'Internal server error' })
  }
})

// GET user by username
app.get('/username/:username', async (req, res) => {
  const username = req.params.username
  try {
    const user = await User.findAll({
      attributes: ['username', 'email'],
      where: { username: username },
    })
    if (user.length === 0) {
      res.status(404).json({ code: 404, data: 'user not found' })
    } else {
      res.json({ code: 200, data: user })
    }
  } catch (e) {
    res.status(500).json({ code: 500, data: 'Internal server error' })
  }
})

// GET user by email
app.get('/email/:email', async (req, res) => {
  const email = req.params.email
  try {
    const user = await User.findAll({
      attributes: ['username', 'email'],
      where: { email: email },
    })
    if (user.length === 0) {
      res.status(404).json({ code: 404, data: 'user not found' })
    } else {
      res.json({ code: 200, data: user })
    }
  } catch (e) {
    res.status(500).json({ code: 500, data: 'Internal server error' })
  }
})

// GET all users
app.get('/users', async (req, res) => {
  try {
    const users = await User.findAll({
      attributes: ['username', 'email'],
    })
    if (users.length === 0) {
      res.status(404).json({ code: 404, data: 'users not found' })
    } else {
      res.json({ code: 200, data: users })
    }
  } catch (e) {
    res.status(500).json({ code: 500, data: 'Internal server error' })
  }
})

// Start express server
app.listen(PORT, IP, () => {
  console.log(`listening on ${IP}:${PORT}`)
})
```
