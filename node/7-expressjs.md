# **express**

## **description**

site officiel: https://expressjs.com  
**express** est décrit comme
_'Fast, unopinionated, minimalist web framework for Node.js'_

- fast: bénéficie des caractéristiques asynchrone de node.js.
- unopinionated: ne nous oblige pas à développer nos applications web en suivant une certaine idéologie ou architecture.
- minimalist: bien que express peut nous permettre de créer des applications web complexe, il est modulable et l'on peut se contenter des composants simples de ce framework.
- web framework: express est utilisé dans le composant web server et/ou application de notre dapp. Il peut notre permettre de développer un web server pour servir des fichiers html, css ou js, ou plus majoritairement, lorsque l'on souhaite publier une API accessible à des clients HTTP, tel que browser.

Pour résumé lorsque l'on souhaite créer une application présistante qui communique avec le protocole HTTP on utilise express

## **instalation**

```zsh
% npx djinit first-express-app
% cd first-express-app
% yarn add express
```

## **1er programme**

```js
// import de express
import express from 'express'

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

// démarrage de notre serveur sur le port 3000
app.listen(PORT, () => {
  //exécution d'un affichage au lacement du serveur.
  console.log(`Example app listening at http://localhost:${PORT}`)
})
```

Notre serveur est accesible depuis notre navigateur, ou même une requête avec axios, sur http://localhost::3000

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
import express from 'express'
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

#### **string patters**

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
import express from 'express'

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

Nous pouvons utiliser plusieurs route handlers (la callback que l'on passe lors de la definition de notre route).

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
les route handlers sont exécutés dans l'ordre dans lequel ils sont déclarés, ils prennent un paramètre supplémentaires qui est `next` et doivent appeller `next()` pour passer à l'handler suivant lorsque le traitement est terminé.

```js
// import de express
import express from 'express'
import fs from 'fs/promises'

const LOG_FILE = 'access-log.txt'

// async file logger
const logger = async (req) => {
  try {
    const date = new Date()
    const log = `${date.toUTCString()} ${req.method} "${
      req.originalUrl
    }" from ${req.ip} ${req.headers['user-agent']}\n`
    await fs.appendFile(LOG_FILE, log, 'utf-8')
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

Un raccourci syntaxique existe lorsqu'on veut appliquer plusieures méthodes HTTP à la même route.

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
import express from 'express'
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
import express from 'express'
import { wiki } from './wiki.js'

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

Dans le chapitre **chaining route handlers** nous avons montré comment effecuter des
opérations entre la récéption d'une requête et l'envoi d'une réponse.
C'est très pratique lorsque l'on doit effectuer de petites opérations, sinon la bonne méthode est d'utiliser des **middleware**
Les middleware nous permettent d'éxecuter ces handlers sur la globalité des routes de l'application ou sur certaines routes précises.
Dans sa définition un middleware n'est qu'un handler:

```js
const LOG_FILE = 'access.log'
const logger = async (req, res, next) => {
  try {
    const date = new Date()
    const log = `${date.toUTCString()} ${req.method} "${
      req.originalUrl
    }" from ${req.ip} ${req.headers['user-agent']}\n`
    await fs.appendFile(LOG_FILE, log, 'utf-8')
  } catch (e) {
    console.error(`Error: can't write in ${LOG_FILE}`)
  }
  next()
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
import express from 'express'
import fs from 'fs/promises'

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
    await fs.appendFile(LOG_FILE, log, 'utf-8')
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

## **serve static files**

## **serve a website**
