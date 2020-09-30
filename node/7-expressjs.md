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
app.get('/ab?cd', function (req, res) {
  res.send('ab?cd')
})
```

```js
// route path match abcd, abbcd, abbbcd, and so on.
app.get('/ab+cd', function (req, res) {
  res.send('ab+cd')
})
```

```js
// route path will match abcd, abxcd, abRANDOMcd, ab123cd,
// and so on.
app.get('/ab*cd', function (req, res) {
  res.send('ab*cd')
})
```

```js
// This route path will match /abe and /abcde.
app.get('/ab(cd)?e', function (req, res) {
  res.send('ab(cd)?e')
})
```

```js
// This route path will match anything with an “a” in it.
app.get(/a/, function (req, res) {
  res.send('/a/')
})
```

```js
// This route path will match butterfly and dragonfly,
// but not butterflyman, dragonflyman, and so on.
app.get(/.*fly$/, function (req, res) {
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
app.get('/users/:userId/books/:bookId', function (req, res) {
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
