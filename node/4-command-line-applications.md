# Interactive command line applications

## Généralités et concepts

Nous savons passer des arguments à une fonction par example:

```js
//ex05.js
const showStars = (nbStars) => {
  for (let i = 1; i <= nbStars; i += 1) {
    console.log('*'.repeat(i))
  }
}
```

Afin d'ajouter de l'interactivité le paramètre `nbStars` de la fonction `showStars` devrait être récupéré depuis l'environement extérieur de notre programme `ex05.js`. On parle d'`inputs`.  
Avec différents `inputs` une fonction, et d'une manière globale notre programme donc, va générer différents `outputs`.  
Les notions `input` et `output` prennent un sens différent selon que l'on en parle dans un contexte matériel: clavier ou écran, de programmation fonctionnelle ou de programmation classique.

Nous utiliserons donc les notions suivantes:

- Pour une fonction:
  - `input`: paramètres passés à la fonction
  - `output`: ce que la fonction `return`
  - `side effect`: interaction de la fonction avec l'environement, par exemple, si notre fonction utilise `console.log` ou écrit dans une fichier
- Pour un programme:
  - `input`: les paramètres passés à notre programme lors de son éxectution en ligne de commande. Par exemple pour la commande `git init my-project`, le programme `git` prend comme `input` l'argument `init` et l'argument `my-project`
  - `output`: ce que produit notre programme. Dans le cas de la commande `git init my-project` l'`output` est le repertoire `./my-project/`crée, ainsi qu'un sous repertoire `./my-project/.git/` contenant des fichiers de configuration `git`

## Arguments de la ligne de commande

```js
//ex05.js
const showStars = (nbStars) => {
  for (let i = 1; i <= nbStars; i += 1) {
    console.log('*'.repeat(i))
  }
}
console.log(showStars(10))
```

le programme `ex05.js` fonctionne comme prévu, lorsque nous l'éxecutons depuis la ligne de commande nous obtenons l'affichage espéré:

```zsh
% node ex05.js
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

Nous souhaitons ajouter un argument sur ligne de commande correspondera au nombre d'étoiles à afficher:

```zsh
% node ex05.js 3
*
**
***
% node ex05.js 5
*
**
***
****
*****
```

Pour cela nous allons utiliser la propriété `argv` de l'objet `process`: "`process.argv`"  
documentation officielle: https://nodejs.org/docs/latest/api/process.html#process_process_argv
`process.argv` est un tableau de `string`. C'est un tableau qui contient tous les arguments que nous avons passé depuis la ligne de commande au lancement de notre programme.
`process` est un objet global créé pour chaque programme implicitement. Il est accessible depuis tous les programmes `node.js`

```js
//prog.js
console.log(process.argv[0])
console.log(process.argv[1])
console.log(process.argv[2])
console.log(process.argv[3])
```

Ce programme affiche sur la console le 1er, 2eme, 3eme et 4eme élement du tableau `process.argv`, qui correspondent donc au 1er, 2eme, 3eme et 4eme arguments de la ligne de commande:

```js
% node ./prog.js arg1 arg2
/usr/local/Cellar/node/14.10.1/bin/node
/Users/akersof/vsproject/js-training/src/prog.js
arg1
arg2
```

Le 1er argument de la ligne de commande est **node**.  
Le 2nd argument de la ligne de commande est **prog.js**.  
le 3eme argument de la ligne de commande est **arg1**.  
le 4eme argyment de la ligne de commande est **arg2**.  
On peut conclure que:  
`process.argv[0]` sera toujours `node`  
`process.argv[1]` sera toujours le nom de notre programme/script javascript  
Et qu'a partir de `process.argv[2]` on accède aux paramètres que l'on souhaite passer à notre programme.
<br />
Donc pour récupérer les arguments que l'on passera à notre programme il faudra le faire à partir du **3eme** argument de la ligne de commande, qui sera donc le **3eme** element du tableau `process.argv` qui est accessible depuis l'index 2: `process.argv[2]`.  
Si l'on suit l'exemple précedent process.argv est un tableau qui contient ces élements:

```js
;['node', '/Users/akersof/vsproject/js-training/src/prog.js', 'arg1', 'arg2']
```

Puisque process.argv est un tableau de `string` nous pouvons appliquer dessus toutes les opérations que peut supporter un tableau:

_process-args.js:_

```js
// print process.argv
process.argv.forEach((val, index) => {
  console.log(`${index}: ${val}`)
})

//length of process.argv (numbers of args passed on the command line)
console.log(`nb args: ${process.argv.length}`)
```

```zsh
% node process-args.js one two=three four
0: /usr/local/Cellar/node/14.10.1/bin/node
1: /Users/akersof/vscode/js-training/src/process-args.js
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
% node sayHello.js Alyra
Hello, Alyra
```

_sayHello.js_:

```js
let name = process.argv[2]
console.log(`Hello, ${name}`)
```

```zsh
% node sayHello.js Sofiane
Hello, Sofiane
% node sayHello.js Alyra
Hello, Alyra
% node sayHello.js
Hello, undefined
% node sayHello.js Sofiane Alyra World
Hello, Sofiane
```

Toujours, toujours, toujours verifier et checker l'input qu'un utilisateur donnerait à notre programme.  
Mettons en place cette sécurité pour notre programme _sayHello.js_.  
Ce que nous attendons de l'utilisateur c'est qu'il ne passe qu'une seul argument à notre programme, ni plus ni moins. Pour cela on peut effectuer un test sur le nombre d'élements de `process.argv`:

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
% node sayHello.js Alyra
Hello, Alyra
% node sayHello.js
usage: node sayHello.js name
% node sayHello.js Sofiane Alyra World
usage: node sayHello.js name
```

### **interactive stars program**

Tous les arguments passés à la ligne de commande sont récupérés dans notre tableau `process.argv` comme des strings. Si nous souhaitons récupérer un nombre passé comme arguments il va donc falloir le convertir en nombre.
Pour cela on utilise la fonction `Number`:

```js
Number('123') // returns the number 123
Number('123') === 123 // true

Number('unicorn') // NaN
Number(undefined) // NaN
```

La fonction `Number` retourne le nombre correspondant à la `string` passée en paramètre sinon elle retourne `NaN` (Not a Number).  
Donc pour vérifier qu'une string peut être convertie en nombre il faut utiliser la fonction `isNaN` pour verifier que la conversion est possible avant de l'effectuer:

```js
let nb_string = '123'
if (isNaN(nb_string)) {
  console.log(`${nb_string} can not be converted to a number.`)
} else {
  let nb = Number(nb_string)
  console.log(`nb = ${nb}`)
}
```

Utilisons cela pour notre programme _stars.js_:

```js
// Note fonction ShowStars
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
// Nous somme OK
let nb = Number(process.argv[2])
showStars(nb)
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
