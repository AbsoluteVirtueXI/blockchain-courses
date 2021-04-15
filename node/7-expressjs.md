# **express**

## **description**

site officiel: https://expressjs.com  
**express** est décrit comme
_'Fast, unopinionated, minimalist web framework for Node.js'_

- fast: bénéficie des caractéristiques asynchrone de node.js.
- unopinionated: ne nous oblige pas à développer nos applications web en suivant une certaine idéologie ou architecture.
- minimalist: bien que express peut nous permettre de créer des applications web complexe, il est modulable et l'on peut se contenter des composants simples de ce framework.
- web framework: express est utilisé dans le composant web server et/ou application de notre dapp. Il peut notre permettre de développer un web server pour servir des fichiers html, css ou js, ou plus majoritairement, lorsque l'on souhaite publier une API accessible à des clients HTTP, tel que browser.

Pour résumé lorsque l'on souhaite créer une application persistante qui communique avec le protocole HTTP on utilise express

## **installation**

```zsh
yarn add express
```

## **1er programme**

```js
// import de express
const express = require('express')

// definition de notre app
const app = express()

// le port d'écoute de notre serveur
const PORT = 3333

// définition d'une route '/', la route par défaut.
// lorsqu'un client effectuera une requête sur ce endpoint
// on lui retournera le texte 'Hello World!' via la callback/
// Cette callback est aussi appellée 'handler function'
app.get('/', (req, res) => {
  res.send('Hello World!')
})

// démarrage de notre serveur sur le port 3000
app.listen(PORT, () => {
  //exécution d'un affichage au lacement du serveur.
  console.log(`Example app listening at http://localhost:${PORT}`)
})
```

Notre serveur est accessible depuis notre navigateur, ou même une requête avec axios, sur http://localhost::3000

## **routing**

### **basics**

Dans notre code une route est définie de cette manière:  
 `app.METHOD(PATH, HANDLER)`

- app est une instance d'`express`
- METHOD est la méthode HTTP supportée pour cette route
  une liste des méthodes HTTP: https://fr.wikipedia.org/wiki/Hypertext_Transfer_Protocol#M%C3%A9thodes
- PATH est le chemin d'accès sur le serveur
- HANDLER est la fonction exécutée lorsque notre route match avec la requête

```js
const express = require('express')
const app = express()

const IP_LOOPBACK = 'localhost'
const IP_LOCAL = '192.168.0.11' // my local ip on my network
const PORT = 3000

// GET sur la racine
app.get('/', (req, res) => {
  //nous recupérons l'ip source de la requête
  res.send(`Welcome ${req.ip} to my first express app.`)
})

// POST sur la racine
app.post('/', (req, res) => {
  res.send("Sorry we don't post requests yet.")
})

// GET sur '/hello'
app.get('/hello', (req, res) => {
  res.send('Hello World!')
})

// GET sur '/hello/sofiane'
app.get('/hello/sofiane', (req, res) => {
  res.send('Hello Sofiane!')
})

// GET sur '/hello/franck'
app.get('/hello/franck', (req, res) => {
  res.send('Hello Franck!')
})

// start the server
app.listen(PORT, IP_LOCAL, () => {
  console.log(`Example app listening at http://${IP_LOCAL}:${PORT}`)
})
```

### **advanced path handling**

#### **string patterns**

On peut aussi utiliser des `string patterns` pour le path de notre route:

```js
// route path match acd and abcd
app.get('/ab?cd', (req, res) => {
  res.send('ab?cd')
})
```

```js
// route path match abcd, abbcd, abbbcd, and so on.
app.get('/ab+cd', (req, res) => {
  res.send('ab+cd')
})
```

```js
// route path will match abcd, abxcd, abRANDOMcd, ab123cd,
// and so on.
app.get('/ab*cd', (req, res) => {
  res.send('ab*cd')
})
```

```js
// This route path will match /abe and /abcde.
app.get('/ab(cd)?e', (req, res) => {
  res.send('ab(cd)?e')
})
```

```js
// This route path will match anything with an “a” in it.
app.get(/a/, (req, res) => {
  res.send('/a/')
})
```

```js
// This route path will match butterfly and dragonfly,
// but not butterflyman, dragonflyman, and so on.
app.get(/.*fly$/, (req, res) => {
  res.send('/.*fly$/')
})
```

#### **route parameters**

Un pattern qui est très utilisé pour match de manière dynamique sur les requêtes.
We can handle requests with parameters

```js
// import de express
const express = require('express')

// definition de notre app
const app = express()

// le port d'écoute de notre serveur
const PORT = 3000

// définition d'une route '/', la route par défaut.
// lorsqu'un client effectuera une requête sur ce endpoint
// on lui retournera le texte 'Hello World!' via la callback/
// Cette callback est aussi appellée 'handler function'
app.get('/', (req, res) => {
  res.send('Hello World!')
})

// a route with parameters userId & BookId
// GET /users/11/books/13
app.get('/users/:userId/books/:bookId', (req, res) => {
  res.send(
    `Book with id ${req.params.bookId} for user with id ${req.params.userId}`
  )
})

// démarrage de notre serveur sur le port 3000
app.listen(PORT, () => {
  //exécution d'un affichage au lacement du serveur.
  console.log(`Example app listening at http://localhost:${PORT}`)
})
```

#### **chaining route handlers**

Nous pouvons utiliser plusieurs route handlers (la callback que l'on passe lors de la définition de notre route).

```js
app.get(
  '/',
  (req, res, next) => {
    console.log('The response will be sent by the next function')
    next()
  },
  (req, res) => {
    res.send('Welcome')
  }
)
```

Nos handlers agissent ainsi comme un **middleware** (notion que l'on verra plus tard).
Le principe est d'effectuer des traitements entre l'arrivée de la requête et l'envoi de notre réponse.
les route handlers sont exécutés dans l'ordre dans lequel ils sont déclarés, ils prennent un paramètre supplémentaires qui est `next` et doivent appeler `next()` pour passer à l'handler suivant lorsque le traitement est terminé.

```js
// import de express
const express = require('express')
const fsPromises = require('fs/promises')

const LOG_FILE = 'access-log.txt'

// async file logger
const logger = async (req) => {
  try {
    const date = new Date()
    const log = `${date.toUTCString()} ${req.method} "${
      req.originalUrl
    }" from ${req.ip} ${req.headers['user-agent']}\n`
    await fsPromises.appendFile(LOG_FILE, log, 'utf-8')
  } catch (e) {
    console.error(`Error: can't write in ${LOG_FILE}`)
  }
}

// show on console
const shower = async (req) => {
  const date = new Date()
  const log = `${date.toUTCString()} ${req.method} "${req.originalUrl}" from ${
    req.ip
  } ${req.headers['user-agent']}`
  console.log(log)
}

const app = express()
const IP = '192.168.0.11'
const PORT = 7777

app.get(
  '/hello',
  async (req, res, next) => {
    await logger(req)
    next()
  },
  (req, res, next) => {
    shower(req)
    next()
  },
  (req, res) => {
    res.send(`Hello ${req.ip}`)
  }
)

app.get(
  '/bye',
  async (req, res, next) => {
    await logger(req)
    next()
  },
  (req, res, next) => {
    shower(req)
    next()
  },
  (req, res) => {
    res.send(`Goodbye ${req.ip}`)
  }
)

app.listen(PORT, IP, () => {
  //exécution d'un affichage au lacement du serveur.
  console.log(`Example app listening at http://${IP}:${PORT}`)
})
```

L'exemple précédent montre l'utilisation de 2 routes handlers qui seront exécutés avant de envoi de notre réponse.  
Un handler journalisera la requête de l'utilisateur dans le fichier `access-log.txt` et le suivant affiche des informations sur la console.  
Pendant que vous effectuez des requêtes sur les routes `/hello` et `/bye` vous pouvez utiliser la commande `tail -f access-log.txt` pour voir les dernières lignes ajoutées à la volée.

Nous pouvons aussi passer un tableau de callback à notre route et même un mélange de fonction et de tableau de callbacks

```js
const cb_logger = async (req, res, next) => {
  await logger(req)
  next()
}
const cb_shower = async (req, res, next) => {
  await shower(req)
  next()
}

const cb_last = async (req, res, next) => {
  console.log('the response will be sent by the next function')
  next()
}

app.get('/hello', [cb_logger, cb_shower], cb_last, (req, res) => {
  res.send(`Hello ${req.ip}`)
})
```

#### **chainable route: app.route()**

Un raccourci syntaxique existe lorsqu'on veut appliquer plusieurs méthodes HTTP à la même route.

```js
app
  .route('/meteo')
  .get(function (req, res) {
    res.send('Get a random temperatue')
  })
  .post(function (req, res) {
    res.send('Add a temperature')
  })
  .put(function (req, res) {
    res.send('Update a temperature')
  })
```

#### **express.Router**

`express.Router` nous permet de créer des routes modulaires que l'on peut attacher à notre application principale.
Avec la classe `express.Router` on peut ainsi travailler sur une sous partie de notre app/site et ensuite l'attacher à une route parente.
C'est très pratique lorsque notre app se divise en certaines parties distinctes, comme une app principale qui possède une route qui la brancherait sur une app secondaire et une route qui la brancherait sur une partie wiki.
On monte un `router` avec la méthode `use()`

_wiki.js_:

```js
const express = require('express')
export const wiki = express.Router()
wiki.get('/', (req, res) => {
  res.send('Welcome to the wiki')
})
wiki.get('/about', (req, res) => {
  res.send('about wiki page')
})
```

_app.js_:

```js
// import de express
const express = require('express')
const { wiki } = require('./wiki')

const app = express()
const IP = '192.168.0.11'
const PORT = 7777

app.use('/wiki', wiki)

app.get('/', (req, res) => {
  res.send('Welcome to my express app')
})

app.get('/about', (req, res) => {
  res.send('About my express app')
})

app.listen(PORT, IP, () => {
  //exécution d'un affichage au lacement du serveur.
  console.log(`Example app listening at http://${IP}:${PORT}`)
})
```

## **middleware**

Dans le chapitre **chaining route handlers** nous avons montré comment effectuer des
opérations entre la réception d'une requête et l'envoi d'une réponse.
C'est très pratique lorsque l'on doit effectuer de petites opérations, sinon la bonne méthode est d'utiliser des **middleware**
Les middleware nous permettent d'exécuter ces handlers sur la globalité des routes de l'application ou sur certaines routes précises.
Dans sa définition un middleware n'est qu'un handler:

```js
const LOG_FILE = 'access.log'
const logger = async (req, res, next) => {
  try {
    const date = new Date()
    const log = `${date.toUTCString()} ${req.method} "${
      req.originalUrl
    }" from ${req.ip} ${req.headers['user-agent']}\n`
    await fsPromises.appendFile(LOG_FILE, log, 'utf-8')
  } catch (e) {
    console.error(`Error: can't write in ${LOG_FILE}`)
  } finally {
    next()
  }
}
```

Pour utiliser un middleware pour toutes les routes de notre app:

```js
app.use(logger) // toutes les routes de app utiliseront le middleware logger
```

pour utiliser un middleware sur une route spécifique de notre app:

```js
app.use('/hello', logger) // seulement la route /hello utilisera le middleware logger
```

exemple complet:

```js
// import de express
const express = require('express')
const fsPromises = require('fs/promises')

const LOG_FILE = 'access-log.txt'

// timer middleware
const timer = (req, res, next) => {
  const date = new Date()
  req.requestDate = date.toUTCString()
  next()
}

// logger middleware
const logger = async (req, res, next) => {
  try {
    const log = `${req.requestDate} ${req.method} "${req.originalUrl}" from ${req.ip} ${req.headers['user-agent']}\n`
    await fsPromises.appendFile(LOG_FILE, log, 'utf-8')
  } catch (e) {
    console.error(`Error: can't write in ${LOG_FILE}`)
  } finally {
    next()
  }
}

// shower middleware
const shower = async (req, res, next) => {
  const log = `${req.requestDate} ${req.method} "${req.originalUrl}" from ${req.ip} ${req.headers['user-agent']}`
  console.log(log)
  next()
}

const app = express()
const IP = '192.168.0.11'
const PORT = 7777

// use timer middleware for all routes in the app
app.use(timer)

//use logger middleware for all routes in the app
app.use(logger)

//use shower middleware for the route for path /bye
app.use('/bye', shower)

app.get('/hello', (req, res) => {
  res.send(`Hello ${req.ip}`)
})

app.get('/bye', (req, res) => {
  res.send(`Goodbye ${req.ip}`)
})

app.listen(PORT, IP, () => {
  //exécution d'un affichage au lacement du serveur.
  console.log(`Example app listening at http://${IP}:${PORT}`)
})
```

Les middleware sont exécutés dans l'ordre des appels de `app.use` sur ces middleware.

## **handling post requests**

### **Rappel sur JSON**

Lorsqu'on doit recevoir ou envoyer des données l'un des formats de données les plus utilisés est le JSON, JavaScript Object Notation.
Ce format respecte la syntaxe des objets javascript associant une clé à une valeur.
Le format JSON est très pratique lorsqu'on travaille en javascript car le format de ce fichier, ou de string, peut être très facilement converti en object javascript, ou vice versa d'un objet javascript en string JSON.

```js
// string récupérée depuis package.json
const jsonString = `
{
    "name": "first-express-app",
    "version": "1.0.0",
    "author": "AbsoluteVirtueXI <absolutevirtuexi@gmail.com>",
    "license": "MIT",
    "type": "module",
    "exports": {
      "./": "./src/"
    },
    "devDependencies": {
      "eslint": "^7.10.0",
      "prettier": "^2.1.2"
    },
    "dependencies": {
      "express": "^4.17.1"
    }
  }
`
// JSON.parse convertit la string JSON passée en
// paramète en un objet javascript
const jsObject = JSON.parse(jsonString)

// update la propriété name
jsObject.name = 'json-testing-app'

// ajoute une prorpiété date
jsObject.date = new Date().toUTCString()

// affiche l'objet javascript
console.log(jsObject)

// JSON.stringify convertit l'objet javascript en string JSON
let newJsonString = JSON.stringify(jsObject)

// affiche la string
console.log(newJsonString)
```

`JSON.parse(jsonString)` => convertit une string JSON en un objet javascript  
`JSON.stringify(jsObject)` => convertit un objet javascript en une string JSON

Lors du développement d'une API REST, les requêtes GET du client entraineront probablement une réponse contenant une string JSON depuis notre application, et les requêtes POST du client contiendront une string JSON que l'on convertira en objet javascript à la reception.

les valeurs associées à une clé dans une string JSON peuvent être:

- un nombre
- une string
- un boolean
- un tableau
- un objet
- null

```JSON
{
  "firstName": "John",
  "lastName": "Smith",
  "isAlive": true,
  "age": 27,
  "address": {
    "streetAddress": "21 2nd Street",
    "city": "New York",
    "state": "NY",
    "postalCode": "10021-3100"
  },
  "phoneNumbers": [
    {
      "type": "home",
      "number": "212 555-1234"
    },
    {
      "type": "office",
      "number": "646 555-4567"
    }
  ],
  "children": [],
  "spouse": null
}
```

```js
// la variable json contient la data JSON ci dessus.
const person = JSON.parse(json)
console.log(person.address.city)
console.log(person.phoneNumbers[1].number)
```

### **Send a POST request from client side**

Tester les requêtes GET d'un client sur nos applications express peut se faire depuis un navigateur.
Pour les requêtes POST c'est plus difficile.  
Quelques options seraient:

- Créer une interface web d'ou l'on pourrait submit une requête POST depuis le navigateur
- Utiliser un outil en ligne de commande comme `curl` ou en developper un avec `axios`
- Utiliser un logiciel ou une extension de navigateur pour effectuer des requêtes POST

```js
try {
  // If second parameter is an object, axios will
  // automatically serialize the object to JSON for us
  // and set Content-Type to 'application/json'
  let res1 = await axios.post('http://www.my-app.com/login', {
    user: 'alice',
    password: '!WoRdPaSs1235711',
  })
  console.log(res1)

  const json = JSON.stringify({ user: 'bob', password: 'password123' })
  // make sure you set the Content-Type header if you pass a
  // pre-serialized JSON string to axios.post().
  const res2 = await axios.post('http://www.my-app.com/login', json, {
    headers: {
      // Overwrite Axios's automatically set Content-Type
      'Content-Type': 'application/json',
    },
  })
  console.log(res2)
} catch (e) {
  console.error(e)
}
```

Sinon le moyen le plus rapide pour effectuer une requête POST est d'utiliser une extension de navigateur ou un logiciel.
Un exemple d'extension sur firefox est _RESTer_: https://addons.mozilla.org/en-US/firefox/addon/rester/  
Comme logiciel j'utilise par habitude _AdvancedRestClient_: https://install.advancedrestclient.com/install

Dans tous les cas, il faudra toujours configurer le `header` de votre requête pour que:

```json
'Content-type': 'application/json''
```

### **Receive a POST requests on express side**

Pour récupérer des données depuis une requête POST, il est requis d'installer le package `body-parser`. C'est un middleware.

```zsh
yarn add body-parser
```

```js
import express from 'express'
import bodyParser from 'body-parser'
const app = express()

const IP = '192.168.0.11'
const PORT = 7777

//Configure express to use body-parser as middleware.
app.use(bodyParser.urlencoded({ extended: false })) // to support URL-encoded bodies
app.use(bodyParser.json()) // to support JSON-encoded bodies

app.post('/hello', (req, res) => {
  // request.body is a js object containing the deserialized JSON
  console.log(req.body)
  //close the connection
  res.end()
})

app.listen(PORT, IP, () => {
  console.log(`listening on ${IP}:${PORT}`)
})
```

les requêtes pour se logger effectuent en général une requête POST lorsque le bouton submit d'une formulaire de login est cliqué.  
Côté backend on pourrait retrouver un code qui ressemblerait à ci-dessous:

```js
import express from 'express'
import bodyParser from 'body-parser'

// Our user database
const db_user = {
  alice: '123',
  bob: '456',
  charlie: '789',
}

// Middleware for checking if user exists
const userChecker = (req, res, next) => {
  const username = req.body.username
  if (db_user.hasOwnProperty(username)) {
    next()
  } else {
    res.send('Username or Password invalid.')
  }
}

// Middleware for checking if password is correct
const passwordChecker = (req, res, next) => {
  const username = req.body.username
  const password = req.body.password
  if (db_user[username] === password) {
    next()
  } else {
    res.send('Username or password invalid.')
  }
}

const IP = '192.168.0.11'
const PORT = 7777

const app = express()

// Configure express to use body-parser as middleware.
app.use(bodyParser.urlencoded({ extended: false })) // to support URL-encoded bodies
app.use(bodyParser.json()) // to support JSON-encoded bodies

// Configure express to use these 2 middleware for /login route only
app.use('/login', userChecker)
app.use('/login', passwordChecker)

// Create route /login for POST method
// we are waiting for a POST request with a body containing a json data
app.post('/login', (req, res) => {
  let username = req.body.username
  res.send(`Welcome to your dashboard ${username}`)
})

app.listen(PORT, IP, () => {
  console.log(`listening on ${IP}:${PORT}`)
})
```

## **serve static files**

On peut aussi avec express servir des fichiers statiques: html, css, javascript, images, etc... Ainsi pour peut mettre mettre en ligne notre site ou notre application `react`.
Pour cela on utilise le middleware `express.static`.
Ce middleware est natif à express, donc pas besoin de l'installer.
documentation officielle: https://expressjs.com/en/starter/static-files.html

Si l'on crée dans notre projet express un dossier `public` qui contient tous les fichiers générés par un build react, (`yarn build` générera votre app `react`, tous les fichiers et dossiers générés seront stockés sous le répertoire `build/`)
on pourra ainsi servir ce dossier `public` avec:

```js
app.use(express.static('public'))
```

Ainsi tout notre projet react stocké dans le répertoire `public` sera accessible depuis l'url de base: http://192.168.0.11

Le répertoire `public` est relatif au répertoire d'où on lance notre commande `node`.
Donc si on exécute notre application express depuis un répertoire ou le dossier `public` est présent il n'y aura pas de problème.  
Mais si on souhaite exécuter notre application express depuis un répertoire différent cela posera problème. Pour cela il faudra que l'on travaille avec des chemins absolus.

```js
// We can't use __filename and __dirname directive anymore in esm modules
const __filename = fileURLToPath(import.meta.url) //chemin absolu de notre app.js
const __dirname = dirname(__filename) // repertoire absolu ou est stocké notre app.js

//serve static file
app.use(express.static(path.join(__dirname, '../public')))
```

Pourquoi `../public` dans l'exemple précédent ?  
Depuis le début de nos cours nos scripts sont stockés dans notre package sous le répertoire `src/`, il faut donc revenir dans le répertoire parent afin d'avoir le dossier `public/` dans le répertoire courant.

Ajoutons à notre app de login précédente, la capacité d'afficher une app react copiée dans répertoire `public`.

```js
import express from 'express'
import bodyParser from 'body-parser'

import { fileURLToPath } from 'url'
import path from 'path'

// We can't use __filename and __dirname directive anymore in esm modules
const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

// Our user database
const db_user = {
  alice: '123',
  bob: '456',
  charlie: '789',
}

// Middleware for checking if user exists
const userChecker = (req, res, next) => {
  const username = req.body.username
  if (db_user.hasOwnProperty(username)) {
    next()
  } else {
    res.send('Username or Password invalid.')
  }
}

// Middleware for checking if password is correct
const passwordChecker = (req, res, next) => {
  const username = req.body.username
  const password = req.body.password
  if (db_user[username] === password) {
    next()
  } else {
    res.send('Username or password invalid.')
  }
}

const IP = '192.168.0.11'
const PORT = 7777

const app = express()

// Configure express to use body-parser as middleware.
app.use(bodyParser.urlencoded({ extended: false })) // to support URL-encoded bodies
app.use(bodyParser.json()) // to support JSON-encoded bodies

//serve static files
app.use(express.static(path.join(__dirname, '../public')))

// Configure express to use these 2 middleware for /login route only
app.use('/login', userChecker)
app.use('/login', passwordChecker)

// Create route /login for POST method
// we are waiting for a POST request with a body containing a json data
/*
format de json attendu:
{
    "username": "alice",
    "password" : "123"
}
*/
app.post('/login', (req, res) => {
  let username = req.body.username
  res.send(`Welcome to your dashboard ${username}`)
})

app.listen(PORT, IP, () => {
  console.log(`listening on ${IP}:${PORT}`)
})
```

L'application précédente offre 2 fonctionnalités:

- Accès à une app react en allant sur http://192.168.0.11:7777
- Une système de login simple accessible par des requêtes POST sur
  http://192.168.0.11:7777/login.
  Le format du JSON attendu est:

```JSON
{
  "username": "alice",
  "password": "123"
}
```

Un bon exercice serait de créer une app react qui proposerait à un utilisateur d'entrer un login et mot de passe, et qui effectuera une requête au serveur express pour une tentative de login!!
