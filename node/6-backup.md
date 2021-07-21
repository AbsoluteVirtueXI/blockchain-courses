## **asynchronous programming with callback**

Les api asynchrones de forme callback, **callback-based API**, ne retournent pas de valeurs à l'appellant. On ne peut donc pas avoir accès au résultat d'une **callback-based API**.  
Elles prennent en paramètre une **callback** qui sera executée avec le résultat, ou l'erreur de la **callback-based API**.

```js
import fs from 'fs'

console.log('START OF PROGRAM')

//asynchronous reading of file1.txt
fs.readFile('./file1.txt', 'utf-8', (err, data) => {
  if (err) console.error(err)
  else console.log('file1.txt: ', data)
})

//asynchronous reading of file2.txt
fs.readFile('./file2.txt', 'utf-8', (err, data) => {
  if (err) console.error(err)
  else console.log('file2.txt: ', data)
})

console.log('END OF PROGRAM') // not executed last!!
```

```zsh
START OF PROGRAM
END OF PROGRAM
file1.txt:  content of file1.txt
file2.txt:  content of file2.txt
```

### **callback hell**

L’utilisation massive de callbacks est considérée comme une mauvaise pratique, on parle alors de **Callback hell** (l’enfer des fonctions de rappel en français).  
Elle est également connue sous le nom de "Pyramid of doom" en raison de l’indentation qui croît à chaque appel d’une fonction asynchrone.

```js
import fs from 'fs'
fs.stat('./file1.txt', (err, stats) => {
  if (err) console.error(err)
  else {
    if (stats.isFile()) {
      fs.readFile('./file1.txt', 'utf8', (err, txt) => {
        if (err) console.log(err)
        else {
          txt = txt + '\nAppended something!'
          fs.writeFile('./file1.txt', txt, (err) => {
            if (err) console.log(err)
            else console.log('Appended text!')
          })
        }
      })
    }
  }
})
```

### **then/catch**:

Une autre syntaxe peut être utilisée pour exploiter les promises:

```js
import fs from 'fs/promises'

console.log('START OF PROGRAM')

fs.stat('./file1.txt')
  .then((stats) => {
    if (stats.isFile()) {
      return fs.readFile('./file1.txt', 'utf-8')
    }
  })
  .then((txt) => {
    txt = txt + '\nAppended something!'
    return fs.writeFile('./file1.txt', txt)
  })
  .then(() => {
    console.log('Done')
  })
  .catch((err) => {
    console.log('Error from catch:', err)
  })
console.log('END OF PROGRAM') // NOT EXECUTED LAST!!
```

L'avantage de cette syntaxe c'est que nous pouvons 2 tâches en parallèle sans trop d'effort.

```js
import fs from 'fs/promises'

const readFile1 = async () => {
  let content = await fs.readFile('./file1.txt', 'utf-8')
  return content
}

const readFile2 = async () => {
  let content = await fs.readFile('./file2.txt', 'utf-8')
  return content
}

readFile1().then(console.log)
readFile2().then(console.log)
```

## illustration des promises avec des timers

Pour cela nous allons utiliser la fonction `setTimeout` pour simuler des opérations qui prennent du temps à s'exécuter.

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
      if (willFilled === true) {
        console.log(`Log: task${id} done after ${timeout} seconds`)
        resolve(`result from task${id}`)
      } else {
        reject(`faillure from task${id}`)
      }
    }, timeout * 1000)
  })
}
```
