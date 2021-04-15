# Asynchronous programming 1

Toutes les fonctions qui ont accès à autre chose que la mémoire vive de l'ordinateur sont, ou devraient, être asynchrones.  
La raison est que l'on ne sait jamais à quel moment ces fonctions seront complètement exécutées pour ensuite exploiter leur valeur de retour ou bien leur `side effect` sans bloquer notre programme.  
Deux choses fondamentales nous intéressent lorsqu'on travaille avec des fonctions asynchrones:

- Exécuter des fonctions asynchrones dans un ordre particulier et attendre la complétude à chaque fois car ces fonctions dépendent les unes des autres: l'output (ou le side-effect) d'une fonction asynchrone doit être utilisé par une autre fonction asynchrone suivante. C'est surtout ce dont à besoin un dev de smart contracts et de Dapp.
- Exécuter des fonctions asynchrones en parallèle car ces fonctions sont indépendantes les unes des autres. L'exécution complète d'une tâche n'a aucun impact ou ne dépend pas d'une autre tâche exécutée en parallèle. Dans ce cas il s'agit surtout d'une fonction asynchrone parent qui exécutera plusieurs autres fonctions asynchrones enfants. Cette fonction asynchrone parent sera considérée comme complètement exécutée lorsque toutes ses tâches enfants le seront aussi.

## Contrôler l'ordre d'exécution des fonctions asynchrones

```js
// add-users.js
const fsPromises = require('fs/promises')

const USERS_FILE = 'users.json'

const addUser = async (name, age, isDev) => {
  try {
    const stat = await fsPromises.stat(USERS_FILE) // STEP 1 get Stats object
    if (stat.isFile()) {
      let jsonString = await fsPromises.readFile(USERS_FILE, 'utf-8') // STEP 2 read file
      const users = JSON.parse(jsonString)
      users[name] = { age: age, isDev: isDev }
      jsonString = JSON.stringify(users)
      await fsPromises.writeFile(USERS_FILE, jsonString) // STEP 3 write file
    }
  } catch (e) {
    // if USERS_FILE does not exist create it
    // and call again the function addUser
    if (e.code === 'ENOENT') {
      const emptyJsonString = '{}'
      await fsPromises.writeFile(USERS_FILE, emptyJsonString)
      await addUser(name, age, isDev)
    } else {
      // else just re throw error to caller
      throw e
    }
  }
}

const main = async () => {
  try {
    await addUser('alice', 28, true)
    await addUser('bob', 33, false)
    await addUser('charlie', 23, false)
    await addUser('dan', 45, true)
    await addUser('eve', 51, true)
  } catch (e) {
    console.error(`main: ${e.message}`)
  }
}

main()
```

Dans notre fonction `addUser` `STEP 1`, `STEP 2` et `STEP 3` doivent absolument être exécutés dans cet ordre. Sinon notre programme n'a aucun sens.
De plus notre fonction `main` appelle successivement la fonction `addUser` avec différents arguments.
Sans les `await` les différents appels à `addUser` effectueraient en parallèle des manipulations sur le même fichier `users.json`, entrainant des lectures/écritures partielles du fichier qui sont impossibles à prévoir.  
Essayez de retirer les `await` dans la fonction `main` et constater l'état du fichier `users.json`.  
Essayez d'imaginer le fil d'exécution du programme qui amène à un tel fichier.

Notre programme _add-users.js_ est bloquant.  
Nous utilisons des fonctions asynchrones mais elles sont exécutées une par une dans une ordre défini, l'une après l'autre.  
C'est exactement ce qu'on veut, sinon notre programme n'aurait aucun sens.  
Contrairement aux module `fs` qui nous offre la possibilité d'utiliser aussi une version synchrone des fonctions, les nombreux modules que nous utiliserons ne fournissent que des fonctions asynchrones. Il faudra donc simuler une exécution synchrone comme dans l'exemple précédent pour une exécution cohérente.

## Exécuter des tâches en parallèle

Selon vous est ce que ce programme à du sens ?

```js
// get-html-size.js
const axios = require('axios')

const getHtmlSize = async (url) => {
  try {
    const response = await axios.get(url)
    return response.headers['content-length']
  } catch (e) {
    throw e
  }
}

const main = async () => {
  try {
    const url1 = 'https://en.wikipedia.org/wiki/Fravia'
    const url2 = 'https://en.wikipedia.org/wiki/Old_Red_Cracker'

    const size1 = await getHtmlSize(url1)
    console.log(`size of page ${url1}: ${size1 / 1000}KB`)

    const size2 = await getHtmlSize(url2)
    console.log(`size of page ${url2}: ${size2 / 1000}KB`)
  } catch (e) {
    console.error(e.message)
  }
}

main()
```

Actuellement le programme exécute `getHtmlSize(url1)`, bloque jusqu'a ce que la promise soit résolue, en cas de succès `size1` contiendra la taille de la page et ensuite un `console.log` l'affichera.  
Ensuite `getHtmlSize(url2)` est exécutée, bloque jusqu'a ce que la promise soit résolue, en cas de succès `size2` contiendra la taille de la seconde page et ensuite un `console.log` l'affichera.  
Les 2 calls sont indépendants, il faudrait dans ce cas les exécuter en même temps pour gagner du temps d'exécution:

```js
// get-html-size.js
const axios = require('axios')

const getHtmlSize = async (url) => {
  try {
    const response = await axios.get(url)
    return response.headers['content-length']
  } catch (e) {
    throw e
  }
}

const main = async () => {
  try {
    const url1 = 'https://en.wikipedia.org/wiki/Fravia'
    const url2 = 'https://en.wikipedia.org/wiki/Old_Red_Cracker'

    const p1 = getHtmlSize(url1)
    const p2 = getHtmlSize(url2)

    const [size1, size2] = await Promise.all([p1, p2]) // Attente de la résolution des 2 promises !!

    console.log(`size of page ${url1}: ${size1 / 1000}KB`)
    console.log(`size of page ${url2}: ${size2 / 1000}KB`)
  } catch (e) {
    console.error(e.message)
  }
}

main()
```

Dans l'exemple précédent nous n'attendons plus la résolution de la promise de `getHtmlSize(url1)`pour appeler `getHtmlSize(url2)`.  
Les 2 tâches sont appelées à la suite et s'exécutent en parallèle.  
Mais nous avons besoin de la valeur de retour de ces 2 appels de fonctions pour faire les affichages sur la console. Nous devons donc attendre que les 2 promises se complètent avant d'effectuer les affichages.  
On utilise pour cela `Promise.all`.  
[Promise.all sur MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all)
Cette fonction prend comme paramètre un tableau de promises et retourne une unique promise qui contiendra un tableau de tous les résultats si elle est complétée avec succès.  
Si l'une des promises est `rejected` alors l'unique promise retournée par `Promise.all` sera aussi `rejected`.
`Promise.all` est à utiliser si l'ensemble des fonctions asynchrones peuvent être exécuter en parallèle et qu'il faut absolument que toutes les promises soient résolues avec succès!  
Si la résolution de **toutes** les promises avec succès n'est pas nécessaires et que des erreurs sont tolérables il faudra alors plutôt utiliser `Promise.allSettled`.

```js
// get-html-size.js
const axios = require('axios')

const getHtmlSize = async (url) => {
  try {
    const response = await axios.get(url)
    return response.headers['content-length']
  } catch (e) {
    throw e
  }
}

const main = async () => {
  const url1 = 'https://en.wikipedia.org/kiki/water_on_mars' // BAD URL
  const url2 = 'https://en.wikipedia.org/wiki/Old_Red_Cracker'

  const p1 = getHtmlSize(url1)
  const p2 = getHtmlSize(url2)

  const [result1, result2] = await Promise.allSettled([p1, p2])

  if (result1.status === 'fulfilled') {
    console.log(`size of page ${url1}: ${result1.value / 1000}KB`)
  } else {
    console.error(`${url1}: ${result1.reason}`)
  }
  if (result2.status === 'fulfilled') {
    console.log(`size of page ${url2}: ${result2.value / 1000}KB`)
  } else {
    console.error(`${url2}: ${result2.reason}`)
  }
}

main()
```

[Promise.allSettled sur MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/allSettled).

Si il n'y a que la première promise résolue qui nous intéresse nous pouvons utiliser [Promise.race](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/race).

## illustration des promises avec des timers

Pour cela nous allons utiliser la fonction `setTimeout` pour simuler des opérations qui prennent du temps à s'exécuter.
La fonction `setTimeout` fonctionne comme ci dessous:

```js
console.log('START OF PROGRAM')
// Affiche 'tac' après 5 secondes
setTimeout(() => {
  console.log('tac')
}, 5000)
// Affiche 'tic' après 2 secondes
setTimeout(() => {
  console.log('tic')
}, 2000)
```

output:

```zsh
START OF PROGRAM    # print at the beginning of the program
tic                 # print after 2 seconds
tac                 # print after 5 seconds
```

Créons une fonction asynchrone qui retourne une **promise**.  
Elle prend comme paramètre un `id` qui nous permettra d'identifier la tâche exécutée, un `timeout` qui correspondra au temps d'exécution de la tâche et un `boolean` pour créer une promise qui sera `fulfilled` si `true` ou `rejected` si `false`:

```js
const asyncTask = (id, timeout, willFulFilled) => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (willFulFilled === true) {
        // ce console.log simule un side effect
        console.log(`Log: task${id} done after ${timeout} seconds`)
        // la valeur de retour est contenu dans le resolve
        resolve(`result from task${id}`)
      } else {
        reject(new Error(`faillure from task${id}`))
      }
    }, timeout * 1000)
  })
}
```

Exécutons quelques tâches asynchrones:

```js
const main = async () => {
  asyncTask(1, 10, true)
  asyncTask(2, 5, true)
  asyncTask(3, 0.5, true)
  asyncTask(4, 1, true)
}
main()
```

output:

```zsh
Log: task3 done after 0.5 seconds
Log: task4 done after 1 seconds
Log: task2 done after 5 seconds
Log: task1 done after 10 seconds
```

On remarque que les tâches s'exécutent bien de manière asynchrone, celle qui ont un timeout plus court se finissent avant celle qui ont un timeout plus long.

Le but de cette fonction `asyncTask` est de vous permettre de tester des exécutions de tâches asynchrones sans passer par de véritable fonctions de packages qui utilisent de véritables ressources comme le système de fichier ou le réseau.

Si l'on souhaite utiliser la syntaxe avec `await` un **très mauvais** programme serait:

```js
const main = async () => {
  try {
    let res1 = await asyncTask(1, 10, true)
    console.log(res1)
    let res2 = await asyncTask(2, 5, true)
    console.log(res2)
    let res3 = await asyncTask(3, 0.5, true)
    console.log(res3)
    let res4 = await asyncTask(4, 1, true)
    console.log(res4)
  } catch (e) {
    console.error(e.message)
  }
}
main()
```

output:

```zsh
Log: task1 done after 10 seconds
result from task1
Log: task2 done after 5 seconds
result from task2
Log: task3 done after 0.5 seconds
result from task3
Log: task4 done after 1 seconds
result from task4
```

Malgré que nos fonctions soient asynchrones et retournent des promises, elles sont exécutées comme si elles étaient synchrones. A moins que c'est exactement ce qu'on l'on souhaite il faudrait les lancer de manière concurrentes avec:

```js
const main = async () => {
  try {
    let data = await Promise.all([
      asyncTask(1, 10, true),
      asyncTask(2, 5, true),
      asyncTask(3, 0.5, true),
      asyncTask(4, 1, true),
    ])
    console.log(`results: ${data}`) // data is an array
  } catch (e) {
    console.error(e.message)
  }
}

main()
```

Pratiquez et comprenez l'enchainement et l'exécution de vos tâches asynchrones en utilisant la fonction `asyncTask` et toutes les fonctionnalités sur `promises` que l'on a vu:

- simulation d'un programme synchrone
- tâches concurrentes/parallèles
- avec ou sans `await` (mix d'avec et sans)
- `Promise.all`, `Promise.allSettled`, `Promise.race`, `Promise.any`
- gestion des promises qui sont `rejected` avec des `catch`/`throw`, il faut passer `false` au 3eme paramètre de la fonction `asyncTask` pour que la promise retournée se complète avec le status `rejected`.

## Exemples:

Exécuter et compléter une tâche asynchrone puis exécuter et compléter 3 autres tâches exécutées en parallèle:

```js
const main = async () => {
  try {
    let res3 = await asyncTask(3, 2, true) // 3rd
    console.log(res3)
    const results = await Promise.all([
      asyncTask(4, 3, true),
      asyncTask(1, 1, true),
      asyncTask(2, 0.5, true),
    ])
    for (const res of results) {
      console.log(res)
    }
  } catch (e) {
    console.log(`main: ${e.message}`)
  }
}

main()
```

Exécuter et compléter 3 tâches asynchrones en parallèle puis exécuter et compléter 1 autre tâche:

```js
const main = async () => {
  try {
    const results = await Promise.all([
      asyncTask(3, 2, true),
      asyncTask(1, 1, true),
      asyncTask(2, 0.5, true),
    ])
    for (const result of results) {
      console.log(result)
    }
    const res4 = await asyncTask(4, 0.001, true)
    console.log(res4)
  } catch (e) {
    console.error(e.message)
  }
}

main()
```
