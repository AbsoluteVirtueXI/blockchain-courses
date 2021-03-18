# Interactive command line applications

## Généralités et concepts

Nous savons passer des arguments à une fonction par exemple:

```js
// showStars.js

const showStars = (nbStars) => {
  for (let i = 1; i <= nbStars; i += 1) {
    console.log('*'.repeat(i))
  }
}
```

Afin d'ajouter de l'interactivité le paramètre `nbStars` de la fonction `showStars` devrait être récupéré depuis l'environnement extérieur de notre programme `showStars.js`.  
On parle d'`inputs`.  
Avec différents `inputs` une fonction, et d'une manière globale notre programme donc, va générer différents `outputs`.  
Les notions `input` et `output` prennent un sens différent selon que l'on en parle dans un contexte matériel: clavier ou écran, de programmation fonctionnelle ou de programmation classique.

Nous utiliserons donc les notions suivantes:

- Pour une fonction:
  - `input`: paramètres passés à la fonction
  - `output`: ce que la fonction `return`
  - `side effect`: interaction de la fonction avec l'environnement, par exemple, si notre fonction utilise `console.log` ou écrit dans un fichier
- Pour un programme:
  - `input`: les paramètres passés à notre programme lors de son exécution en ligne de commande. Par exemple pour la commande `git init my-project`, le programme `git` prend comme `input` l'argument `init` et l'argument `my-project`
  - `output`: ce que produit notre programme. Dans le cas de la commande `git init my-project`, l'`output` est le répertoire `./my-project/` crée, ainsi qu'un sous répertoire `./my-project/.git/` contenant des fichiers de configuration `git`.
    Cette commande génère aussi un message sur la console.

Dans le cours précédent nous avons introduit le package `readline-sync` pour créer une calculatrice interactive: https://github.com/AbsoluteVirtueXI/calc
Ce programme prend comme input l'opérateur arithmétique, 2 nombres et retourne le résultat de l'opération sur ces 2 nombres sur la console.

## Interaction avec l'utilisateur

Nous utiliserons la package `readline-sync`: https://github.com/anseki/readline-sync

### Installation:

```zsh
yarn add readline-sync
```

N'oubliez pas que nous devons utiliser la commande `yarn` depuis un répertoire contenant un fichier `package.json`, c'est à dire un répertoire initialisé avec `yarn init`, c'est à un un package `Node.js`.
Désormais, tous nos programmes/Applications `Node.js` seront considérés comme des packages `Node.js`.  
Ils devront donc tous contenir un fichier `package.json`, c'est que le répertoire du projet aura été initialisé avec la commande `yarn init`.

**Utilisation**:

- **cas simple**:

  ```js
  const readlineSync = require('readline-sync')

  let name = readlineSync.question('username: ')
  let password = readlineSync.question('password: ', { hideEchoBack: true })
  console.log(`Hello ${name} your password is: ${password}`)
  ```

- **demander une réponse par une simple touche Y/N**:

  ```js
  const readlineSync = require('readline-sync')

  if (readlineSync.keyInYNStrict('continue? ')) {
    // 'Y' key was pressed.
    console.log('continue...')
    // continuer le programme
  } else {
    // 'N' key was pressded.
    console.log('goodbye!')
    process.exit(0)
  }
  ```

- **choix parmi une liste**:

  ```js
  const readlineSync = require('readline-sync')

  let choix = ['start', 'continue', 'options', 'exit']
  let index = readlineSync.keyInSelect(choix, 'Please select your choice: ')
  switch (index) {
    case 0:
      console.log('starting the game')
      break
    case 1:
      console.log('continue the game')
      break
    case 2:
      console.log('access to game options')
      break
    case 3:
      console.log('closing the game')
      break
    default:
      console.log('bad choice')
  }
  ```

- **simuler un prompt bash**:
  ```js
  const readlineSync = require('readline-sync')
  readlineSync.promptCLLoop({
    cp: (source, destination) => {
      console.log(`copy ${source} to ${destination}`)
      // Do something...
    },
    remove: function (target) {
      console.log(`remove ${target}`)
      // Do something...
    },
    help: () => {
      console.log('command list: cp, remove, help, quit')
    },
    quit: () => {
      return true
    },
  })
  console.log('Exited')
  ```

## Arguments de la ligne de commande

### Introduction

En général les commandes Linux que nous utilisons depuis le début de cette formation prennent des arguments sur la ligne de commande.

la commande `cp` sert à copier un ficher.  
La commande cp prend 2 arguments obligatoires:

- le nom du fichier que l'on souhaite copier: source file
- le nom de la copie: target file

Copier _file1.txt_ vers _file1-copy.txt_:

```zsh
cp file1.txt file1-copy.txt
```

La commande `mkdir` sert à créer un répertoire
La commande `mkdir` prend 1 argument obligatoire:

- le nom du répertoire à créer

Créer un répertoire _i-need-money_:

```zsh
mkdir i-need-money
```

Les commandes `cp` et `mkdir` prennent aussi d'autres arguments pour customiser leur exécutions ce sont des options.  
Les options sont des arguments qui commencent, par convention, par un `-` ou un `--`.
Utiliser `man cp` et `man mkdir` pour avoir une description exhaustive des arguments que l'on peut passer à ces commandes.

### process.argv

```js
// showStars.js

const showStars = (nbStars) => {
  for (let i = 1; i <= nbStars; i += 1) {
    console.log('*'.repeat(i))
  }
}

showStars(10)
```

le programme `showStars.js` fonctionne comme prévu, lorsque nous l'exécutons depuis la ligne de commande nous obtenons l'affichage espéré:

```zsh
% node showStars.js
*
**
***
****
*****
******
*******
********
*********
**********
```

Nous souhaitons ajouter un argument lors de l'appel de notre programme sur la ligne de commande qui correspondra au nombre d'étoiles à afficher:

```zsh
% node showStars.js 3
*
**
***
% node showStars.js 5
*
**
***
****
*****
```

Ainsi notre programme variera en fonction d'un argument sur la ligne de commande.

Pour cela nous allons utiliser la propriété `argv` de l'objet `process`: "`process.argv`"  
Documentation officielle: https://nodejs.org/docs/latest/api/process.html#process_process_argv
`process.argv` est un tableau de `string`. C'est un tableau qui contient tous les arguments que nous avons passé depuis la ligne de commande au lancement de notre programme.
`process` est un objet global créé pour chaque programme implicitement. Il est accessible depuis tous les programmes `Node.js`

```js
// prog.js a lancer depuis la console: node prog.js arg1 arg2

console.log(process.argv) // Affiche le tableau process.argv
console.log(process.argv[0])
console.log(process.argv[1])
console.log(process.argv[2])
console.log(process.argv[3])
```

Ce programme affiche sur la console le 1er, 2eme, 3eme et 4eme élément du tableau `process.argv`, qui correspondent donc au 1er, 2eme, 3eme et 4eme arguments de la ligne de commande:

```js
% node ./prog.js arg1 arg2
/usr/local/Cellar/node/15.1.0/bin/node
/Users/akersof/VSCodeProjects/junk/prog.js
arg1
arg2
```

Le 1er argument de la ligne de commande est **node**.  
Le 2nd argument de la ligne de commande est **prog.js**.  
le 3eme argument de la ligne de commande est **arg1**.  
le 4eme argument de la ligne de commande est **arg2**.  
On peut conclure que:  
`process.argv[0]` sera toujours `node`  
`process.argv[1]` sera toujours le nom de notre programme/script javascript  
Et qu'a partir de `process.argv[2]` on accède aux paramètres que l'on souhaite passer à notre programme.  
<br />
Donc pour récupérer les arguments que l'on passera à notre programme il faudra le faire à partir du **3eme** argument de la ligne de commande, qui sera donc le **3eme** element du tableau `process.argv` qui est accessible depuis l'index 2: `process.argv[2]`.  
Si l'on suit l'exemple précédent `process.argv` est un tableau qui contient ces éléments:

```js
;[
  '/usr/local/Cellar/node/15.1.0/bin/node',
  '/Users/akersof/VSCodeProjects/junk/prog.js',
  'arg1',
  'arg2',
]
```

Puisque `process.argv` est un tableau de `string` nous pouvons appliquer dessus toutes les opérations que peut supporter un tableau:

_process-args.js:_

```js
// print process.argv
process.argv.forEach((val, index) => {
  console.log(`${index}: ${val}`)
})

//length of process.argv
console.log(`nb args: ${process.argv.length}`)
```

```zsh
node process-args.js one two=three four
0: /usr/local/Cellar/node/15.1.0/bin/node
1: /Users/akersof/VSCodeProjects/junk/process-args.js
2: one
3: two=three
4: four
nb args: 5
```

### **cas d'utilisation simple: sayHello.js**

Nous souhaitons écrire un programme qui prend comme argument sur la ligne de commande un prénom et afficherait:

```zsh
% node sayHello.js Sofiane
Hello, Sofiane
% node sayHello.js HardFork
Hello, HardFork
```

_sayHello.js_:

```js
const name = process.argv[2]
console.log(`Hello, ${name}`)
```

```zsh
% node sayHello.js Sofiane
Hello, Sofiane
% node sayHello.js HardFork
Hello, HardFork
% node sayHello.js
Hello, undefined
% node sayHello.js Sofiane HardFork World
Hello, Sofiane
```

Toujours, toujours, toujours vérifier et checker l'input qu'un utilisateur donnerait à notre programme.  
Mettons en place cette sécurité pour notre programme _sayHello.js_.  
Ce que nous attendons de l'utilisateur c'est qu'il ne passe qu'un seul argument à notre programme, ni plus ni moins. Pour cela on peut effectuer un test sur le nombre d'éléments de `process.argv`:

```js
if (process.argv.length != 3) {
  console.log(`usage: node sayHello.js name`)
  process.exit(1) // exit the program with code status 1
}
let name = process.argv[2]
console.log(`Hello, ${name}`)
```

```zsh
% node sayHello.js Sofiane
Hello, Sofiane
% node sayHello.js HardFork
Hello, HardFork
% node sayHello.js
usage: node sayHello.js name
% node sayHello.js Sofiane HardFork World
usage: node sayHello.js name
```

### **interactive _stars.js_ program**

Tous les arguments passés à la ligne de commande sont récupérés dans notre tableau `process.argv` comme des strings. Si nous souhaitons récupérer un nombre passé comme arguments il va donc falloir le convertir en nombre.
Pour cela on utilise la fonction `Number`:

```js
Number('123') // returns the number 123
Number('123') === 123 // true

Number('unicorn') // NaN
Number(undefined) // NaN
```

La fonction `Number` retourne le nombre correspondant à la `string` passée en paramètre sinon elle retourne `NaN` (Not a Number).  
Donc pour vérifier qu'une string peut être convertie en nombre il faut utiliser la fonction `isNaN` pour vérifier que la conversion est possible avant de l'effectuer:

```js
let nb_string = '123'
if (isNaN(nb_string)) {
  console.log(`${nb_string} can not be converted to a number.`)
} else {
  let nb = Number(nb_string)
  console.log(`nb = ${nb}`)
}
```

Utilisons cela pour notre programme _showStars.js_:

```js
// Notre fonction ShowStars
const showStars = (nbStars) => {
  for (let i = 1; i <= nbStars; i += 1) {
    console.log('*'.repeat(i))
  }
}

// Verifier qu'il n'y a qu'un seul argument passé à notre programme
if (process.argv.length !== 3) {
  console.log('usage: node stars.js number')
  process.exit(1)
}

// Verifier que l'argument passé à notre programme peut être converti en nombre
if (isNaN(process.argv[2])) {
  console.log(`Error: ${process.argv[2]} is not a number.`)
  process.exit(1)
}

// Nous somme OK, il n'y a qu'un seul argument et c'est un nombre.
const nbStars = Number(process.argv[2])
showStars(nbStars)
```

```zsh
% node stars.js sofiane 11 12
usage: node stars.js number
% node stars.js sofiane
Error: sofiane is not a number.
% node stars.js 13
*
**
***
****
*****
******
*******
********
*********
**********
***********
************
*************
```

## Ajouter des couleurs

Nous utiliserons la librairie `chalk`: https://github.com/chalk/chalk

**Installation**:

```zsh
yarn add chalk
```

**Utilisation**:

```js
const chalk = require('chalk')

console.log(chalk.blue('Hello world!'))
```
