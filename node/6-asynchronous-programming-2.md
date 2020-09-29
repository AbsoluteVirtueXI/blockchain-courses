# **Asynchronous programming 2**

## **Rappel**:

Dans le cours précedent nous avons vu comment organiser des appels de fonctions asynchrones grâce à des **callbacks** ou des **promises**
Vous devez saisir qu'on ne peut savoir lorsqu'une function asynchrone va retourner. Nous n'avons que 2 possibilités d'exploiter son résultat, utiliser des **callbacks** ou utiliser des **promises**:

_Utilisation de *callback* pour exploiter le résultat de la fonction `fs.readFile`_:

```js
import fs from 'fs'

fs.readFile('./file1.txt', 'utf-8', (err, data) => {
  if (err) console.error(err)
  else console.log('file1.txt: ', data)
})
fs.readFile('./file2.txt', 'utf-8', (err, data) => {
  if (err) console.error(err)
  else console.log('file2.txt: ', data)
})
// A ce niveau les 2 call a fs.readFile sont exécutés en parallèle.
// L'une ou l'autre peut se compléter à tout moment

console.log('END') // affiche 'END' avant que les 2 fs.readFile soit complétées
```

Mais avec les **callbacks** si nous voulions combiner les 2 résultats il faudrait imbriquer les callbacks:

```js
import fs from 'fs'

fs.readFile('./file1.txt', 'utf-8', (err, data1) => {
  if (err) console.error(err)
  fs.readFile('./file2.txt', 'utf-8', (err, data2) => {
    if (err) console.log(err)
    let content = data1 + '\n' + data2
    fs.writeFile('./file3.txt', content, (err) => {
      if (err) console.log(err)
      console.log('copy of file1.txt and file2.txt to file3.txt done')
    })
  })
})
```

_Utilisation de *promises* pour exploiter le résultat de la fonction `fs.readFile`_:

```js
import fs from 'fs/promises'
let promise1 = fs.readFile('./file1.txt', 'utf-8') // retourne immédiatement une promise
let promise2 = fs.readFile('./file2.txt', 'utf-8') // retourne immédiatement une promise
// A ce niveau les 2 call à fs.readFile sont exectués en parallèle
// Nous devons utiliser await pour récupérer le résultat sinon le programme se terminera
let content1 = await promise1 // Bloque jusqu'a ce que la promise soit complétée
let content2 = await promise2 // Bloque ensuite jusqu'au ce que la promise soit complétée
// A ce niveau les 2 promises ont été complétées
console.log(content1)
console.log(content2)
```

## **illusation des promises avec des timers**:

Pour cela nous allons utiliser la fonction `setTimeout` pour simuler des opérations qui prennent du temps à s'exécuter.

```js
console.log('START OF PROGRAM')
// Affiche 'tick' après 5 secondes
setTimeout(() => {
  console.log('tac')
}, 5000)
// Affiche 'tac' après 2 secondes
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

Créeons une fonction asynchrone qui retourne une **promise**.  
Elle prend comme paramètre un _id_ qui nous premettera d'identifier la tâche executée et un _timeout_ qui correspondera au temps d'exécution de la tâche:

```js
const asyncTask = (id, timeout) => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      console.log(`Log: task${id} done after ${timeout} seconds`)
      resolve(`result from task${id}`)
    }, timeout * 1000)
  })
}
```

Executons quelques tâches asynchrones:

```js
asyncTask(1, 10)
asyncTask(2, 5)
asyncTask(3, 0.5)
asyncTask(4, 1)
```

output:

```zsh
Log: task3 done after 0.5 seconds
Log: task4 done after 1 seconds
Log: task2 done after 5 seconds
Log: task1 done after 10 seconds
```

On remarque que les tâches s'exécutent bien de manière asynchrone, celle qui ont un timemout plus court se finissent avant celle qui ont un timeout plus long.

La probématique est de désormais pouvoir récupérer leur résultat afin d'effectuer.
On peut utiliser la syntaxe `then & catch`:

```js
asyncTask(1, 10).then(console.log)
asyncTask(2, 5).then(console.log)
asyncTask(3, 0.5).then(console.log)
asyncTask(4, 1).then(console.log)
```

output:

```zsh
Log: task3 done after 0.5 seconds
result from task3
Log: task4 done after 1 seconds
result from task4
Log: task2 done after 5 seconds
result from task2
Log: task1 done after 10 seconds
result from task1
```

Si l'on souhaite utiliser la syntaxe avec `await` un **très mauvais** programme serait:

```js
let res1 = await asyncTask(1, 10)
console.log(res1)
let res2 = await asyncTask(2, 5)
console.log(res2)
let res3 = await asyncTask(3, 0.5)
console.log(res3)
let res4 = await asyncTask(4, 1)
console.log(res4)
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

Malgré que nos fonctions soient asynchrones et retournent des promises, elles sont exécutées comme si elles étaient synchrones.  
Pour obtenir une meilleure alternative c'est d'abord de toutes les executer et ensuite d'`await` sur les promises retournées:

```js
let promise1 = asyncTask(1, 10)
let promise2 = asyncTask(2, 5)
let promise3 = asyncTask(3, 0.5)
let promise4 = asyncTask(4, 1)

let res1 = await promise1
console.log(res1)
let res2 = await promise2
console.log(res2)
let res3 = await promise3
console.log(res3)
let res4 = await promise4
console.log(res4)
```

```zsh
Log: task3 done after 0.5 seconds
Log: task4 done after 1 seconds
Log: task2 done after 5 seconds
Log: task1 done after 10 seconds
result from task1
result from task2
result from task3
result from task4
```

Si l'on souhaite exécuter toutes les fonctions asynchrones en même temps on peut aussi utilisé:

```js
let data = await Promise.all([
  asyncTask(1, 10),
  asyncTask(2, 5),
  asyncTask(3, 0.5),
  asyncTask(4, 1),
]).catch((err) => {
  console.error(err)
})
console.log(data)
```

output:

```zsh
Log: task3 done after 0.5 seconds
Log: task4 done after 1 seconds
Log: task2 done after 5 seconds
Log: task1 done after 10 seconds
[
  'result from task1',
  'result from task2',
  'result from task3',
  'result from task4'
]
```

La subtilité dans le cas précédent est que `Promise.all` retourne qu'une seule **promise**, qui sera complétée si, et seulement si, toutes les promises sont compétées avec succès.

On peut également récupérér la valeur de la 1ere promise complétée parmit une liste de fonctions asynchrones executées simultanément, aussi bien en cas de succès que d'une erreur avec la fonction `Promise.race`:

```js
let data = await Promise.race([
  asyncTask(1, 10),
  asyncTask(2, 5),
  asyncTask(3, 0.5),
  asyncTask(4, 1),
]).catch((err) => {
  console.error(err)
})
console.log(data)
```

output

```zsh
Log: task3 done after 0.5 seconds
result from task3
Log: task4 done after 1 seconds
Log: task2 done after 5 seconds
Log: task1 done after 10 seconds
```

## **HTTP requests with axios**:

le package **axios** se décrit comme un: _'Promise based HTTP client for the browser and node.js'_  
documentation officielle: https://github.com/axios/axios

### **example d'utilisation**:

```js
import axios from 'axios'
let res = await axios.get('https://www.google.com')
console.log(res)
```

Puise que nous récupérons une page html nous pouvons l'écrire dans un fichier _index.html_ et l'ouvrir dans notre navigateur:

```js
import axios from 'axios'
import fs from 'fs/promises'
let response = await axios.get('https://www.google.com')
await fs.writeFile('./index.html', response.data)
```
