# Functions in javascript

## Why functions ?

Les fonctions sont l'un des éléments essentiels de Javascript et de la programmation en général.  
Nous pouvons diviser notre programme en différentes fonctions afin de le rendre plus lisible et maintenable.  
Les lignes de codes qui sont écrites plusieurs fois ou le code qui effectue un traitement particulier sont des bons candidats pour des fonctions.  
Une fonction est en réalité que le `binding` d'un nom à un code exécutable.  
Ce code peut ensuite être appelé depuis notre programme grâce à son nom (le nom de la fonction).  
Les fonctions sont aussi très utiles pour cacher une implémentation complexe. Un développeur crée une fonction, et nous pouvons l'importer dans notre code et l'utiliser, sous réserve qu'une documentation sur son utilisation soit fournie.  
Par exemple le package `axios` nous fournit un ensemble de fonctions qui nous permettent d'effectuer des requêtes web (GET, POST, etc) en quelques lignes de code au lieu de plusieurs centaines:

```js
const axios = require('axios') // import du package axios. (il faut l'installer avant avec `yarn add axios`)

;(async () => {
  const response = await axios.get('https://fr.wikipedia.org/wiki/Polkadot') // Récupérer la page HTML
  console.log(response.data) // Afficher la page HTML en brut sur la console
})()
```

L'avantage d'utiliser `axios` au lieu d'utiliser notre propre code c'est qu'`axios` est activement maintenu et testé par la communauté Open source (actuellement 263 contributeurs).

repository officiel de `axios`: https://github.com/axios/axios

## Exemples

Programme principal:

```js
// Affiche un message d'acceuil à une serie d'utilisateurs.
console.log('Start of program.')
console.log(
  'Hello Alice, welcome to the Javascript class, you are user number 1!'
)
console.log(
  'Hello Bob, welcome to the Javascript class, you are user number 2!'
)
console.log(
  'Hello Charlie, welcome to the Javascript class, you are user number 3!'
)
console.log(
  'Hello Craig, welcome to the Javascript class, you are user number 4!'
)
console.log(
  'Hello Eve, welcome to the Javascript class, you are user number 5!'
)
console.log('End of program.')
```

Long et rébarbatif, on voit que le pattern est le même, il n'y a que le prénom et le numéro du user qui est variable, on peut utiliser une boucle pour ça.
Il faut pour cela stocker le nom des utilisateurs dans un tableau, et on peut récupérer le numéro d'utilisateur en fonction de l'index du prénom dans le tableau:

```js
const names = ['Alice', 'Bob', 'Charlie', 'Craig', 'Eve']

console.log('Start of program.')
for (let i = 0; i < names.length; ++i) {
  console.log(
    `Hello ${names[i]}, welcome to the Javascript class, you are user number ${
      i + 1
    }!`
  )
}
console.log('End of program.')
```

On peut aller encore plus loin et générer le message à afficher grâce à une fonction:

```js
// Prend en paramètre une string et un nombre et retourne une string
// ATTENTION: Cette fonction RETOURNE une string, elle ne l'affiche pas!!!!
// Cette fonction est `pure`
const welcomeString = (name, nb) => {
  return `Hello ${name}, welcome to the Javascript class, you are user number ${nb}!`
}

const names = ['Alice', 'Bob', 'Charlie', 'Craig', 'Eve']

console.log('Start of program.')
for (let i = 0; i < names.length; ++i) {
  console.log(welcomeString(names[i], i + 1))
}
console.log('End of program.')
```

On peut rendre notre programme principal encore plus lisible et déporter l'affiche des messages dans une fonction aussi:

```js
// Cette fonction Prend en paramètre une string et un nombre et retourne une string
// ATTENTION: Cette fonction RETOURNE une string, elle ne l'affiche pas!!!!
// Cette fonction est `pure`
const welcomeString = (name, nb) => {
  return `Hello ${name}, welcome to the Javascript class, you are user number ${nb}!`
}

// Cette fonction prend en paramètre un tableau de string
// Cette fonction n'est pas `pure`, elle a un `side effect` à cause du `console.log`, mais
// c'est ce que l'on veut!!
const sayHelloToAll = (names) => {
  for (let i = 0; i < names.length; ++i) {
    console.log(welcomeString(names[i], i + 1))
  }
}

const names = ['Alice', 'Bob', 'Charlie', 'Craig', 'Eve']

// Notre programme principal est plus lisible et compréhensible.
console.log('Start of program.')
sayHelloToAll(names)
console.log('End of program.')
```

Si on nous demande maintenant de gérer 2 sessions d'étudiants, au lieu d'une seule comme dans les exemples précédents, nous pouvons utiliser les mêmes fonctions au lieu de réécrire 2 fois un code identique:

```js
// Cette fonction Prend en paramètre 2 strings et un nombre et retourne une string
// ATTENTION: Cette fonction RETOURNE une string, elle ne l'affiche pas!!!!
// Cette fonction est `pure`
const welcomeString = (name, place, nb) => {
  return `Hello ${name}, welcome to the ${place}, you are user number ${nb}!`
}

// Cette fonction prend en paramètre un tableau de string
// Cette fonction n'est pas `pure`, elle a un `side effect` à cause du `console.log`, mais
// c'est ce que l'on veut!!
const sayHelloToAll = (names, place) => {
  for (let i = 0; i < names.length; ++i) {
    console.log(`\t${welcomeString(names[i], place, i + 1)}`)
  }
}

const session1Place = 'Javascript class'
const session2Place = 'Pitch Pit'
const session1Names = ['Alice', 'Bob', 'Charlie', 'Craig', 'Eve']
const session2Names = ['Dylan', 'Brandon', 'Brenda', 'Steeve', 'Kelly', 'Donna']

// Notre programme principal est plus lisible et compréhensible.
console.log('Start of program.')
console.log('Session 1:')
sayHelloToAll(session1Names, session1Place)
console.log('') // Pour sauter une ligne
console.log('Session 2:')
sayHelloToAll(session2Names, session2Place)
console.log('End of program.')
```

## Function declarations

Il existe 3 syntaxes différentes pour déclarer une fonction:

```js
// arrow function recommandé
const add = (nb1, nb2) => {
  return nb1 + nb2
}
let result = add(7, 2) // result === 9
```

```js
function add(nb1, nb2) {
  return nb1 + nb2
}
let result = add(7, 2) // result === 9
```

```js
// Moins commun
const add = function (nb1, nb2) {
  return nb1 + nb2
}
let result = add(7, 2) // result === 9
```

La déclaration d'une fonction se compose:

- Du nom de la fonction
- Une liste de paramètres entre parenthèses séparés par une virgule `,`
- D'un `statement` `{...}` qui contiendra les instructions à exécuter par cette fonction.
  Ce qui est déclaré dans un `statement`, comme des variables, avec un `let` ou un `const` n'est pas visible en dehors de la fonction.
  Une fonction peut retourner une valeur avec le keyword `return`, c'est souvent pour cela qu'on utilise une fonction.

En réalité une fonction retourne toujours une valeur, si aucune valeur n'est retournée alors `undefined` est retourné par défaut.
Le but d'une fonction peut être juste d'effectuer une tâche sans pour autant retourner une valeur utile à l'appelant.
Par exemple `console.log`, ne sert à qu'a afficher sur la console du texte, aucune valeurs utiles n'est retournée à l'appelant.

```js
console.log('Hello!!')
let res = console.log('Good bye!!')
console.log(res) // output: undefined
```

Il faut absolument déclarer ses fonctions le plus haut possible dans son script Javascript afin de les rendre visibles avant leur exécution.
Exécuter une fonction avant que sa déclaration est été lue par l'interpreteur générera une erreur.  
Lorsque nous travaillerons avec des package `Node.js` nos fonctions seront déclarées dans des fichiers différents que celui de notre programme principal.  
Il faudra pour cela que nous importions ces fonctions dans le fichier de notre programme principal avant de les utiliser.

## Executing functions

**Le rôle d'une fonction est d'effectuer une tâche, en fonction de ces paramètres, et de retourner une valeur si le but de cette fonction est de générer une nouvelle donnée.**

Pour exécuter une fonction, on l'appelle par son nom suivi d'une parenthèse ouvrante et d'une parenthèse fermante. Si la fonction est déclarée avec des paramètres, il faudra alors passer les arguments entre ces deux parenthèses séparés par une virgule.

```js
// Déclaration de showStars.
// nbBase est un entier correspondant au nombre d'étoile de la base de notre pyramide
// reverse est un boolean. Si reverse === true alors afficher la pyramide à l'envers
// showStars ne retourne aucune valeur
const showStars = (nbBase, reverse) => {
  if (!reverse) {
    for (let i = 1; i <= nbBase; ++i) {
      console.log('*'.repeat(i))
    }
  } else {
    for (let i = nbBase; i >= 1; --i) {
      console.log('*'.repeat(i))
    }
  }
}

// Appel de la fonction showStars avec l'argument 5 et true
showStars(5, true)

// Appel de la fonction showStars avec l'argument 10 et false
showStars(10, false)

const nbBase = 15
// Appel de la fonction showStars avec l'argument nbBase qui est égal a 15 et true
showStars(nbBase, true)
```

La fonction `showStars` ne retourne rien, on l'utilise uniquement pour son `side effect`: afficher un message sur la console.  
Afin de respecter le paradigme de la programmation fonctionnelle transformons showStars en fonction `pure`.
`showStars` retournera désormais une `string`, mais sans l'afficher, il sera de la responsabilité de l'appelant de récupérer la `string` et de l'afficher.

```js
// Déclaration de showStars.
// nbBase est un entier correspondant au nombre d'étoile de la base de notre pyramide
// reverse est un boolean. Si reverse === true alors afficher la pyramide à l'envers
// showStars retourne une string contenant la pyramide
const showStars = (nbBase, reverse) => {
  let str = ''
  if (!reverse) {
    for (let i = 1; i <= nbBase; ++i) {
      str += '*'.repeat(i)
      if (i !== nbBase) {
        str += '\n'
      }
    }
  } else {
    for (let i = nbBase; i >= 1; --i) {
      str += '*'.repeat(i)
      if (i !== 1) {
        str += '\n'
      }
    }
  }
  return str
}

// Appel de la fonction showStars avec l'argument 5 et true
// la fonction retourne une string que l'on peut afficher
let str1 = showStars(5, true)
console.log(str1)

// Appel de la fonction showStars avec l'argument 10 et false
// showStars(10, false) est une expression qui est évaluée à une string,
// car showStars retourne une string
// On peut donc directement l'utiliser où une string est attendue,
// comme dans une console.log par exemple
console.log(showStars(10, false))

const nbBase = 15
// Appel de la fonction showStars avec l'argument nbBase qui est égal à 15 et l'argument true
// la fonction retourne une string que l'on peut afficher
let str2 = showStars(nbBase, true)
console.log(str2)
```

Il faut garder à l'esprit qu'une fonction exécutée est une `expression` qui est évaluée à sa valeur de retour:

```js
// Déclaration
const add = (nb1, nb2) => {
  return nb1 + nb2
}

const sum1 = add(10, 11) + add(2, 5) // sum1 === 28
const sum2 = add(add(2, 3), add(7, 4)) // sum2 === 16
const sum3 = add(add(2, 3), add(7, 4)) - 11 // sum3 === 5
```

## Visibility and Scope

Les notions de scopes et de visibilités sont respectées dans les fonctions.

```js
// Déclaration
const add = (nb1, nb2) => {
  let sum = nb1 + nb2
  return sum
}

let sum = 11 // cette variable sum est différente de la variable sum qui est déclarée dans la fonction add
let nb1 = 7 // cette variable nb1 est différente de la variable nb1 de la fonction add
let nb2 = 5 // cette variable nb2 est différente de la variable nb2 de la fonction add
add(10, 25)
console.log(sum) // output: 11
```

## Mutability and Immutability of function parameters

Les concepts de mutabilité et d'immutabilité des données s'appliquent aussi lorsque ces données/variables sont passées à des fonctions:

```js
const add1000 = (nb) => {
  nb += 1000
}

let nb1 = 1 // nb1 est un number, donc immutable
add1000(nb1) // nb1 est passé par copy, nb1 ne pourra pas être modifié
console.log(nb1) // nb1 est immutable car c'est un primitive type number, output: 1

const append2Array = (array) => {
  array.push('SOLEIL')
}

const tab = ['un', 'deux', 'trois'] // tab est un tableau donc il est mutable
append2Array(tab) // tab est passé par référence, tab pourra être modifié
console.log(tab) // tab est mutable car c'est un tableau: output: [ 'un', 'deux', 'trois', 'SOLEIL' ]
```

## Higher-order functions

Une fonction peut être le paramètre d'une autre fonction.

```js
// Déclaration d'une fonction qui prend comme paramètre une fonction et un tableau
// Cette fonction appliquera cette fonction à chaque élement du tableau
// Un nouveau tableau sera retourné
const map = (fn, array) => {
  // On copie le tableau array dans tmpArray pour être sur de ne pas le modifier
  // On utilise pour cela la spread syntax
  const tmpArray = [...array] // Une copie de array.
  const newArray = []
  for (const elem of tmpArray) {
    newArray.push(fn(elem))
  }
  return newArray
}

// Déclaration d'une fonction qui prend une string comme paramètre
// et qui retourne une nouvelle string en majuscule
const capitalize = (str) => {
  return str.toUpperCase()
}

const names = ['alice', 'bob', 'charlie']
let newNames = map(capitalize, names) // Attention capitalize sans parenthèses
console.log(names) // names n'a pas été modifié, output: ['alice', 'bob', 'alice']
console.log(newNames) // output: [ 'ALICE', 'BOB', 'ALICE' ]
```

Nous venons de créer l'équivalent de la méthode `.map` des tableaux:

```js
// Déclaration d'une fonction qui prend une string comme paramètre
// et qui retourne une nouvelle string en majuscule
const capitalize = (str) => {
  return str.toUpperCase()
}
const names = ['alice', 'bob', 'charlie']
const newNames = names.map(capitalize)
console.log(newNames) // // output: [ 'ALICE', 'BOB', 'ALICE' ]
```

Une fonction peut aussi retourner une fonction, sans rentrer dans le détail voici un exemple:

```js
const adder = (nb1) => {
  // return an anonymous function
  return (nb2) => {
    return nb1 + nb2
  }
}

const addBy10 = adder(10)
console.log(addBy10(7)) // output: 17
```

## Anonymous functions

Précédemment nous avons constaté qu'une fonction peut être le paramètre d'une autre fonction, et qu'une fonction peut aussi être retournée par une fonction.  
Il peut être fastidieux de donner un nom à tout.
Nous l'avons déjà expérimenté lorsqu'on ecrit de simple expression comme:

```js
let sum = 10 + 11
```

La version fastidieuse serait:

```js
let nb1 = 10
let nb2 = 11
let sum = nb1 + nb2
```

Dans le même principe si l'on se sert qu'une fois d'une fonction, notamment lors de son passage en paramètre à une autre fonction, il est recommandé de ne pas lui attribué de nom.

```js
const map = (fn, array) => {
  // On copie le tableau array dans tmpArray pour être sur de ne pas le modifier
  // On utilise pour cela la spread syntax
  const tmpArray = [...array] // Une copie de array.
  const newArray = []
  for (const elem of tmpArray) {
    newArray.push(fn(elem))
  }
  return newArray
}

const names = ['alice', 'bob', 'charlie']
// On passe une fonction anonyme à la fonction map
let newNames = map((name) => {
  return name.toUpperCase()
}, names)
console.log(newNames) // output: [ 'ALICE', 'BOB', 'ALICE' ]
```

Nous avons déjà utilisé plusieurs fois ces fonctions anonymes depuis le début de cette formation:

```js
// (elem) => {console.log(elem)} est une fonction anonyme, donc sans nom
;['Alice', 'Bob', 'Alice'].map((elem) => {
  console.log(elem)
})

// (elem) => {return elem % 2 !== 0} est une fonction anonyme
const oddArray = [1, 2, 3, 4, 5, 6].filter((elem) => {
  return elem % 2 !== 0
})
console.log(oddArray) // output: [ 1, 3, 5 ]
```

## Closure

```js
const functionFactory = () => {
  let i = 0
  return () => {
    i += 1
    console.log(`function used ${i} times`)
  }
}

let closure = functionFactory()
closure() // output: 'function used 1 times'
closure() // output: 'function used 2 times'
closure() // output: 'function used 3 times'
closure() // output: 'function used 4 times'
```

Ce concept est redondant avec la notion de programmation orienté objet, qu'il faudra préférer aux closures.  
Pour plus d'information sur les closures: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures

## Recursive functions
