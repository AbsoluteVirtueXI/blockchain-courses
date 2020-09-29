# ** Asynchronous programming 1 **

Jusqu'a présent nous n'avons écrit que des programmes **bloquants**.  
On parle de programmation **synchrones**, en anglais **synchronous programming**.  
Les fonctions sont executées dans l'ordre où elles apparaissent dans notre script et bloquent jusqu'a ce qu'elles aient retourné leur valeur.  
Mais lorsque l'on souhaite intéragir avec le réseau, comme effectuer des requêtes HTTP, ou bien lorsqu'on souhaite intéragir avec le système de fichiers, comme ouvrir un fichier, nous exécutons des fonctions qui peuvent prendre du temps avant de retourner leur résultat.  
Afin d'éviter de bloquer notre programme lors de l'exécution d'une fonction, on utilise les caractéristiques **asynchrone** de node.js, on parle alors d'**asynchronous programming**

## **introduction au module `fs`**:

Depuis node.js toutes les fonctions qui ont accès au système de fichiers sont importables depuis le module **fs**.  
Documentation officielle de l'API **fs**: https://nodejs.org/api/fs.html

```js
import fs from 'fs'
let content = fs.readFileSync('./file.txt', 'utf-8')
console.log(content)
```

## **synchronous programming**

```js
import fs from 'fs'

console.log('START OF PROGRAM')

// try to read file1.txt
try {
  // step 1: read file1.txt
  let content1 = fs.readFileSync('./file1aze.txt', 'utf-8')
  // step 2: write on screen content1
  console.log('file1.txt: ', content1)
} catch (e) {
  console.log('in first catch')
  console.error(e)
} finally {
  console.log('in first finally')
}

// try to read file2.txt
try {
  // step 3: read file2.txt
  let content2 = fs.readFileSync('./file2.txt', 'utf-8')
  // step 4: write on screen content2
  console.log('file2.txt: ', content2)
} catch (e) {
  console.log('in second catch')
  console.error(e)
} finally {
  console.log('in second finally')
}

console.log('END OF PROGRAM')
```

```zsh
START OF PROGRAM
file1.txt:  content of file1.txt
in first finally
file2.txt:  content of file2.txt
in second finally
END OF PROGRAM
```

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

## **asynchronous programming with promises**

Pour rendre le code d'un programme asynchrone plus lisible on utilise les **promises**.

### **async / await**

```js
import fs from 'fs/promises'

console.log('START OF PROGRAM')

try {
  let stats = await fs.stat('./file1.txt')
  if (stats.isFile()) {
    let txt = await fs.readFile('./file1.txt', 'utf-8')
    txt = txt + '\nAppended something!'
    await fs.writeFile('./file1.txt', txt)
    console.log('Appended text!')
  }
} catch (e) {
  console.error(e)
} finally {
  console.log('END OF PROGRAM')
}
```

On retrouve ainsi la même structure de code qu'un programme synchrone.  
Pour utiliser la directive `await` nous devons être dans une fonction asynchrone.  
Dans l'exemple précedent nous sommes au `Top-level`, c'est à dire le script qui est directement executé par node. A ce niveau la directive `await` est disponible, sinon, lorsque nous sommes dans une autre fonction il faut qu'elle soit déclarée avec la directive `async`:

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

console.log('START OF PROGRAM')
let content1 = await readFile1()
console.log(content1)
let content2 = await readFile2()
console.log(content2)
console.log('END OF PROGRAM')
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
