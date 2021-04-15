# Asynchronous programming 2

Pour simplifier les exemples du cours nous utiliserons la fonction `asyncTask` pour simuler des tâches asynchrones:

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

## Loop and asynchronous programming

### Exécuter des tâches asynchrones depuis une boucle.

On peut utiliser des fonctions asynchrones dans des loops classiques: `for`, `for..of`, `while`, `do-while`.  
Une boucle peut être utilisée pour lancer une suite de tâche asynchrones:

```js
for (let i = 1; i <= 10; ++i) {
  asyncTask(i, i, true)
}
```

Si nous voulons exploiter le résultat ou l'exception de ces tâches asynchrones il va falloir utiliser un `await`.  
Si nous souhaitons exécuter ces tâches en parallèle un mauvais programme serait:

```js
// Ce n'est pas ce qu'on veut!!
const main = async () => {
  try {
    for (let i = 1; i <= 10; ++i) {
      let res = await asyncTask(i, i, true) // Bloquant
      console.log(`got result: ${res}`)
    }
  } catch (e) {
    console.error(e.message)
  }
}
main()
```

Il faut pour cela lancer l'exécution des tâches asynchrones dans la boucles, mais attendre leur résolution à l'extérieur de cette boucle sinon on bloquerait la boucle inutilement:

```js
const main = async () => {
  let promises = []
  for (let i = 1; i < 10; ++i) {
    promises.push(asyncTask(i, i, true))
  }
  try {
    let results = await Promise.all(promises)
    for (const result of results) {
      console.log(`got result: ${result}`)
    }
  } catch (e) {
    console.error(e.message)
  }
}

main()
```

### Itérer sur un tableau de promises

Dans l'exemple précédents `promises` est un tableau de promises.
Une autre solution plus élégantes serait d'itérer sur un tableau de promises avec la boucle `for await...of`:

```js
const main = async () => {
  let promises = []
  for (let i = 1; i < 10; ++i) {
    promises.push(asyncTask(i, i, true))
  }
  try {
    for await (const result of promises) {
      console.log(`got result: ${result}`)
    }
  } catch (e) {
    console.error(e.message)
  }
}

main()
```

## then/catch syntax

Au lieu d'utiliser la syntaxe `async/await` une alternative est d'utiliser la syntaxe `then/catch` pour travailler avec des promises.

```js
const fsPromises = require('fs/promises')

console.log('START OF PROGRAM')

fsPromises
  .stat('./file1.txt')
  .then((stats) => {
    if (stats.isFile()) {
      return fsPromises.readFile('./file1.txt', 'utf-8')
    }
  })
  .then((txt) => {
    txt = txt + '\nAppended something!'
    return fsPromises.writeFile('./file1.txt', txt)
  })
  .then(() => {
    console.log('Done')
  })
  .catch((e) => {
    console.log('Error from catch:', e.message)
  })
console.log('END OF PROGRAM') // NOT EXECUTED LAST!!
```

L'avantage de cette syntaxe c'est que nous pouvons 2 tâches en parallèle sans trop d'effort.

```js
const fsPromises = require('fs/promises')

const readFile1 = async () => {
  let content = await fsPromises.readFile('./file1.txt', 'utf-8')
  return content
}

const readFile2 = async () => {
  let content = await fsPromises.readFile('./file2.txt', 'utf-8')
  return content
}

readFile1().then(console.log)
readFile2().then(console.log)
```
