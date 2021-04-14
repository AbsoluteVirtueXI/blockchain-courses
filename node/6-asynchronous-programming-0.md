# Asynchronous programming 0

## Introduction

Jusqu'a présent nous n'avons écrit que des programmes **bloquants**.  
On parle de programmation **synchrones**, en anglais **synchronous programming**.  
Les fonctions sont exécutées dans l'ordre où elles apparaissent dans notre script et bloquent jusqu'a ce qu'elles aient retourné leur valeur.  
Mais lorsque l'on souhaite interagir avec le réseau, comme effectuer des requêtes HTTP, ou bien lorsqu'on souhaite interagir avec le système de fichiers, comme ouvrir un fichier, nous exécutons des fonctions qui peuvent prendre du temps avant de retourner leur résultat.  
Afin d'éviter de bloquer notre programme lors de l'exécution d'une fonction, on utilise les caractéristiques **asynchrone** de Node.js, on parle alors d'**asynchronous programming**

```js
const fs = require('fs')
console.log('Start of program')
try {
  const txt = fs.readFileSync('big-file.txt', 'utf-8') // how much time for executing this?
  console.log(txt)
} catch (e) {
  console.error(e.message)
}
console.log('End of program')
```

Dans le programme précédent `fs.readFileSync('big-file.txt', 'utf-8')` lira le fichier `big-file.txt`, de manière `synchrone`, cela veut dire que le programme va bloquer jusqu'a ce que le fichier soit entièrement lu ou jusqu'a ce qu'une exception soit levée.  
**Mais attention en général c'est exactement ce qu'on veut!!! Dans notre exemple ci dessus nous voulons qu'absolument `big-file.txt` soit lu avec `const txt = fs.readFileSync('big-file.txt', 'utf-8')` avant que l'on puisse effectuer son affichage avec `console.log(txt)`.**

Avec la programmation asynchrone nous pouvons:

- Appeler des fonctions qui peuvent prendre du temps à s'exécuter sans bloquer notre programme.
- Organiser correctement l'ordre d'exécution de ces fonctions car nous ne pouvons pas déterminer quand est ce qu'une fonction asynchrone va se terminer.

Il existe 2 façons de travailler avec des fonctions asynchrones en Javascript:

- Avec des fonctions asynchrones qui supportent des `callbacks`
- Avec des fonctions asynchrones qui supportent des `promises`

Il faudra se référer à la documentation des fonctions/api que l'on souhaite utiliser pour savoir si ces fonctions asynchrones supportent les `callbacks`, les `promises` ou les deux.
Mais en général les fonctions et api que l'on va utiliser supportent les 2 types de méthodes.
Par exemple les fonctions du module `fs` et les fonctions du package `axios` supportent aussi bien les `promises` que les `callbacks`.

les `promises` permettent d'écrire du code asynchrone qui ressemble à du code synchrone. Donc plus lisible et plus maintenable.  
**Dans le doute privilégiez l'utilisation d'api/fonctions qui supportent des `promises`.**

## Promises (les promesses)

Une `promise` est un objet qui est retourné par une fonction asynchrone au moment de son appel.
Une `promise` est une promesse de retour de notre fonction. Nous avons la certitude qu'une fonction asynchrone va s'exécuter complètement, mais nous ne savons pas quand.  
Cette `promise` nous permet de vérifier l'état de l'exécution de notre fonction
Cet objet contient l'état de l'exécution de notre fonction asynchrone.
Il existe 3 état:

- `pending`: l'exécution de la fonction est toujours en cours.
- `fulfilled`: l'exécution de la fonction est terminé avec succès. Dans ce cas la `promise` contiendra le résultat de notre fonction, on pourra donc l'extraire.
- `rejected`: l'exécution de la fonction est terminé mais avec une erreur. Dans ce cas la `promise` contiendra l'erreur, on pourra donc l'extraire.

Une fois que notre promise est dans un état `fulfilled` ou `rejected` on dit que la promise a été `resolved` (résolue).

```js
// my-readfile.js
const fsPromises = require('fs/promises') // pour utiliser les Promises API du module fs
try {
  // readFile retourne une promise et pas le texte du fichier!!!
  const p1 = fsPromises.readFile('hello.txt', 'utf-8') // exécution de readFile
  const p2 = fsPromises.appendFile('hello.txt', 'some new data\n') // exécution de appendFile
  console.log(p1) // Affiche l'objet p1 qui est une promise
  console.log(p2) // Affiche l'objet p2 qui est une promise
} catch (e) {
  // On gère les erreurs comme dans un code synchrone
  console.error(e.message)
}
```

```zsh
node my-readfile.js
Promise { <pending> }
Promise { <pending> }
```

`p1` et `p2` sont bien des `promises` qui ont été retournées immédiatement lors de l'appel des fonctions `readFile` et `appendFile`.  
les `promises` `p1` et `p2` sont dans un état `pending` et nous quittons le programme sans attendre que ces `promises` soit résolues.

La `promise` `p1` est liée à l'exécution de la fonction asynchrone `fsPromises.readFile('hello.txt', 'utf-8')`. Cette `promise` contient l'état de l'exécution de la fonction et contiendra la valeur de retour ou l'erreur lorsque la `promise` sera résolue.
La `promise` `p2` est liée à l'exécution de la fonction asynchrone `fsPromises.appendFile('hello.txt', 'some new data\n')`. Cette `promise` contient l'état de l'exécution de la fonction et contiendra la valeur de retour ou l'erreur lorsque la `promise` sera résolue.

En tant que développeur, ce qui nous intéresse c'est de savoir si cette fonction s'est exécutée complètement, et si cette fonction retourne une valeur utile, l'extraire, ou si une exception a été levée la gérer correctement.
Pour cela on utilise les keywords `async` et `await`.  
**Pour rappel une fonction asynchrone est complètement exécutée lorsque sa `promise` est résolue, c'est à dire qu'elle passe d'un état `pending` à `fulfilled` ou `rejected`.**

## async / await

`await` est un mot clé à associé à une promise **obligatoirement**, ou donc à une fonction qui retourne une `promise`.  
`await` comme son nom le suggère, va attendre que la promise soit résolue et bloquer la portion de code asynchrone, et ensuite extraire son résultat ou son erreur lorsque la `promise` sera résolue.
`async` est un mot clé à associer à la fonction ou le keyword `await` apparait.
**Dans toutes les fonctions que vous écrirez où vous utiliserez `await` il faudra ajouter le keyword `async` à la déclaration de ces fonctions**:

```js
// my-readfile.js
// BAD CODE!!!!!!
const fsPromises = require('fs/promises') // pour utiliser les Promises API du module fs
try {
  // readFile retourne une promise et pas le texte du fichier!!!
  const p1 = fsPromises.readFile('hello.txt', 'utf-8') // exécution de readFile
  const p2 = fsPromises.appendFile('hello.txt', 'some new data\n') // exécution de appendFile
  console.log(p1) // Affiche l'objet p1 qui est une promise
  console.log(p2) // Affiche l'objet p2 qui est une promise
  let txt1 = await p1
  await p2
  console.log(p1) // Affiche l'objet p1 qui est une promise
  console.log(p2) // Affiche l'objet p2 qui est une promise
} catch (e) {
  // On gère les erreurs comme dans un code synchrone
  console.error(e.message)
}
```

```zsh
node my-readfile.js
let txt1 = await p1
             ^^^^^
SyntaxError: await is only valid in async functions and the top level bodies of modules
```

Il faut donc **obligatoirement** encapsulé ce code qui utilise `await` dans une fonction qui sera définie avec le keyword `async`:

```js
// my-readfile.js
const fsPromises = require('fs/promises') // pour utiliser les Promises API du module fs
const myReadFile = async () => {
  try {
    // readFile retourne une promise et pas le texte du fichier!!!
    const p1 = fsPromises.readFile('hello.txt', 'utf-8') // exécution de readFile
    const p2 = fsPromises.appendFile('hello.txt', 'some new data\n') // exécution de appendFile
    console.log(p1) // Affiche l'objet p1 qui est une promise
    console.log(p2) // Affiche l'objet p2 qui est une promise
    let txt1 = await p1
    await p2 // pas de valeur de retour pour appendFile
    console.log(p1) // Affiche l'objet p1 qui est une promise
    console.log(p2) // Affiche l'objet p2 qui est une promise
  } catch (e) {
    // On gère les erreurs comme dans un code synchrone
    console.error(e.message)
  }
}
myReadFile()
```

```zsh
node my-readfile.js
Promise { <pending> }
Promise { <pending> }
Promise { 'Hello world!some new data\n' }
Promise { undefined }
Text read: Hello world!some new data
```

Après nos `await` on remarque que `p1` et `p2` sont résolues.
`p1` contient bien le texte `Hello world!some new data\n`.  
`p2` contient `undefined`, c'est normal car `appendFile` ne retourne rien (mais `p2` est bien résolue!!!).
On remarque que le texte lu du fichier _hello.txt_ avec la fonction `readFile` contient déjà le fichier qui a été ajouté avec la fonction `appendFile`... Pourtant `readFile` a été appelé avant `appendFile`.  
**On ne peut jamais prédire avec précision l'ordre de résolution des promises d'un ensemble de fonctions asynchrones. Et en général, nous voulons absolument que certaines fonctions asynchrones s'exécutent complètement dans un certain ordre.**  
Pour cela il faut que l'on force l'attente de la résolution de la promise retournée par une fonction asynchrone avant d'exécuter la suivante.
Evidement pour cela on utilise `await` pour bloquer un code non bloquant:

```js
const fsPromises = require('fs/promises') // pour utiliser les Promises API du module fs
const myReadFile = async () => {
  try {
    // readFile retourne une promise et pas le texte du fichier!!!
    const txt1 = await fsPromises.readFile('hello.txt', 'utf-8') // exécution de readFile
    await fsPromises.appendFile('hello.txt', 'some new data\n') // exécution de appendFile
    console.log(txt1)
  } catch (e) {
    // On gère les erreurs comme dans un code synchrone
    console.error(e.message)
  }
}
myReadFile()
```

```zsh
node junk1.js
Hello world!
```

## Pratical case with `axios` and `fs`

Nous souhaitons télécharger la page internet accessible sur wikipedia à l'url: https://fr.wikipedia.org/wiki/Black_hat et écrire son contenu sur notre disque dur dans un fichier `black_hat.html`.
Nous n'utiliserons que des fonctions asynchrones et donc l'ordre d'exécution de ces fonctions est très importantes!!

1. Télécharger la page https://fr.wikipedia.org/wiki/Black_hat grâce à `axios`.
   repository officiel de `axios`: https://github.com/axios/axios  
   `yarn add axios` pour installer le package. Se référer à la documentation officielle pour l'utiliser.
2. Ecrire les données reçues sur notre disque avec `writeFile` dans un fichier `black_hat.html`.

```js
const axios = require('axios')
const fsPromises = require('fs/promises')

const main = async () => {
  try {
    const response = await axios.get('https://fr.wikipedia.org/wiki/Black_hat')
    await fsPromises.writeFile('black_hat.html', response.data) // response.data est une string qui est la page html
  } catch (e) {
    console.error(e.message)
  }
}

main()
```
