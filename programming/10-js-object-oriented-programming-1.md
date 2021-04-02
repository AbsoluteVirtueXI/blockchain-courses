# Object oriented programming in Javascript part 1

## OOP Principles

OOP: Object Oriented Programming (en francais programmation orientée objet)  
l'OOP introduit la notion d'objets.
La programmation orientée objet est un paradigme de la programmation.
Il est souvent opposé à une autre paradigme de la programmation: la programmation fonctionnelle.  
Bien que fondamentalement différentes, les deux ne s'opposent pas obligatoirement et un programme peut s'écrire avec les 2 paradigmes.
Ces objets nous permettent 1 fonctionnalité très intéressantes: **l'encapsulation**.
L'encapsulation permet de regrouper des variables et des méthodes dans un même objet, accessibles par un système de clefs/valeurs.

Programmation fonctionnelle:

```js
const run = (name, departure, destination) => {
  return `${name} is running from ${departure} to ${destination}`
}
let name = 'Alice'
let from = 'Wonderland'
let to = 'London'
console.log(run(name, from, to))
```

Même programme en OOP avec un `object literal`:

```js
const run = (person) => {
  return `${person.name} is running from ${person.from} to ${person.to}`
}

const alice = {
  name: 'Alice',
  from: 'Wonderland',
  to: 'London',
}
console.log(run(alice))
```

Même programme que précédemment mais avec la méthode `run` comme propriété de l'objet (pas recommandé, il faudra privilégié les classes pour cela):

```js
const alice = {
  name: 'Alice',
  from: 'Wonderland',
  to: 'London',
  run: function () {
    return `${this.name} is running from ${this.from} to ${this.to}`
  },
  /* 
    pour definir une methode une syntaxe serait
    run() {
      return `${this.name} is running from ${this.from} to ${this.to}`
    },
  */
}
console.log(alice.run())
```

Même programme que précédemment mais en utilisant cette fois une classe:

```js
class Person {
  constructor(name, departure, destination) {
    this.name = name
    this.from = departure
    this.to = destination
  }
  run() {
    return `${this.name} is running from ${this.from} to ${this.to}`
  }
}
const alice = new Person('Alice', 'Wonderland', 'London')
console.log(alice.run())
```

## Object literals

Les `object literals` sont très pratiques pour grouper un ensemble de données, même de différents types dans une même variable:

```js
const alice = {
  firstName: 'Alice',
  age: 27,
  friends: ['Bob', 'Charlie'],
  isDev: true,
}

const bob = {
  firstName: 'Bob',
  age: 30,
  friends: ['Alice', 'Charlie'],
  isDev: false,
}
```

les variables `alice` et `bob` sont des objets, et plus précisément ce sont des `object literals` car ils sont définis directement dans le code source.  
Les propriétés `firstName`, `age`, `friends`, `isDev` sont les propriétés de ces objets, elles peuvent être utilisées et manipulées de la même manière que des variables de leur type.

```js
console.log(alice.firstName)
if (alice.age > bob.age) {
  console.log(`${alice.firstName} is older than ${bob.firstName}.`)
} else if (alice.age < bob.age) {
  console.log(`${alice.firstName} is younger than ${bob.firstName}.`)
} else {
  console.log(`${alice.firstName} and ${bob.firstName} have the same age.`)
}

// It is Alice birthday
alice.age += 1 // now alice is 28 year old

// Print all friends of Bob
for (const friendName of bob.friends) {
  console.log(`${friendName} is a friend of ${bob.firstName}`)
}
```

Les objets peuvent être des paramètres de fonctions:

```js
const printInfo = (person) => {
  // person is an object
  console.log(`first name: ${person.firstName}`)
  console.log(`age: ${person.age}`)
  console.log(`friends:`)
  person.friends.forEach((elem) => {
    console.log(`\t${elem}`)
  })
  console.log(`is dev: ${person.isDev}`)
}

printInfo(alice)
printInfo(bob)
```

Une fonction peut aussi retourner un object:

```js
// This function create an object based on arguments passed
const personFactory = (firstName, age, friends, isDev) => {
  return {
    firstName: firstName,
    age: age,
    friends: friends,
    isDev: isDev,
  }
}

let eve = personFactory('Eve', 23, ['Alice', 'Bob', 'Charlie'], true)
printInfo(eve)
```

La fonction `personFactory` crée un objet et le retourne à l'appelant.
Ainsi au lieu de créer manuellement l'objet littéralement, nous pouvons désormais le créer de manière automatique en fonction des arguments passés à la fonction.  
Cette façon de faire est acceptable lorsque nous devons créer plusieurs objets qui posséderont le même nombre et type de propriétés, et surtout que notre objet ne contienne pas de méthodes. Sinon il faudra utiliser les `class`.

Comme vu dans les exemples précédents les propriétés d'un objet sont accessibles avec l'opérateur `.`.  
Il existe une autre syntaxe avec l'opérateur `[]`:

```js
console.log(alice['firstName']) // output: 'Alice'
bob.firstName === bob['firstName'] // true
if (eve['isDev'] === true) {
  console.log(`${eve['firstName']} is a dev`)
} else {
  console.log(`${eve['firstName']} is not a dev`)
}
```

Comme on le ferait avec un tableau en utilisant l'index de l'élément que l'on souhaite lire ou modifier, on utilise pour un objet une string qui doit être exactement le nom de la propriété, comme elle a été définie.  
Les deux syntaxes effectuent exactement la même opération, elles sont identiques.  
Le seul avantage de la syntaxe avec l'opérateur `[]` est que l'on peut varier sur la propriété que l'on souhaite récupérer, contrairement à la syntaxe avec l'opérateur `.` ou le nom de la propriété doit obligatoirement être écrite dans le code.

```js
const readlineSync = require('readline-sync')
const property = readlineSync.question(
  'Propriété de Alice que vous souhaitez connaitre? '
)
console.log(alice[property])
```

output:

```text
Propriété de Alice que vous souhaitez connaitre? firstName
Alice
Propriété de Alice que vous souhaitez connaitre? age
28
Propriété de Alice que vous souhaitez connaitre? bankAccount
undefined
```

La propriété `bankAccount` n'existe pas dans l'objet `alice`, nous récupérons donc `undefined`.

## class in javascript

Une classe est un "template" qui nous servira à créer des objets.

```js
// class declaration
class Person {
  constructor(firstName, age, friends, isDev) {
    this.firstName = firstName
    this.age = age
    this.friends = friends
    this.isDev = isDev
  }
  learnDev() {
    this.isDev = true
  }
  printInfo() {
    console.log(`first name: ${this.firstName}`)
    console.log(`age: ${this.age}`)
    console.log(`friends:`)
    this.friends.forEach((elem) => {
      console.log(`\t${elem}`)
    })
    console.log(`is dev: ${this.isDev}`)
  }
}

// alice is an instance of Person
const alice = new Person('Alice', 27, ['Bob', 'Charlie'], true)
// bob is an instance of Person
const bob = new Person('Bob', 30, ['Alice', 'Charlie'], false)

console.log(alice.firstName)
console.log(bob.firstName)
alice.printInfo()
bob.printInfo()
bob.learnDev() // bob is now a dev
bob.printInfo()
```

Tout ce que l'on a vu précédemment pour les `object literals` s'applique aux classes.

Un objet encapsule ses données et ses méthodes (fonctionnalités qui peuvent aussi bien lire ou modifier ces données) au sein d'une même variable.
Un objet possède donc un **état** qui sera l'ensemble de toutes ses données et des fonctionnalités qui utiliseront ces données ou modifieront son état interne.

## Declaration and instantiation

C'est un process en 2 étapes

1. Définir une classe avec le keyword `class`
2. Instancier un objet de la classe avec le keyword `new`

```js
// Définit d'une classe Point
class Point {
  constructor(x, y) {
    this.x = x
    this.y = y
  }
  show() {
    console.log(`(${this.x}, ${this.y})`)
  }
  isEqual(point) {
    return this.x === point.x && this.y === point.y ? true : false
  }
}
// p1 est une instance de Point
const p1 = new Point(1, 2)
// p2 est une autre instance de Point
const p2 = new Point(10, 11)
```

- `Point` est une classe que l'on définit grâce au keyword `class`.
- `constructor` est la fonction d'initialisation de notre objet au moment de son instanciation. Elle est appelée automatiquement.  
  Le `constructor` peut prendre des paramètres lorsqu'on a besoin d'initialiser les propriétés de notre objet avec certaines valeurs.
- `show` et `isEqual` sont des méthodes d'instance. Elles ne peuvent être appelées que sur une instance!!!

```js
// OK
p1.isEqual(p2) // return false
p2.show() // print '(10, 11)'

// Error
Point.show() // Point is not an instance of Point.. Point is a class
```

- `this` est un mot clef spécial. Il est interprété comme l'instance en cours!!
  Dans nos exemple précédent, `this` sera interprété comme l'instance `p1` ou l'instance `p2`. Il est obligatoire si on veut référencer, la future instance, dans notre déclaration de classe.
- `new` est l'opérateur d'instanciation de classe.
  `1` et `2` seront passés en argument au constructor de `Point`.

```js
const p1 = new Point(1, 2)
```

## inheritance (héritage)

Une classe peut hériter d'une autre classe.
Cela nous permet de réutiliser du code déjà écrit (une classe déjà écrite).
Lorsqu'une `classeB` hérite d'une `classeA` on dit que:

- `classeB` **hérite** de `classeA`
- `classeB` **spécialise** `classeA`
- `classeB` **is a** `classeA`
- `classeB` est une classe enfant de `classeA`
- `classeA` est une classe parent de `classeB`
- `classeB` _spécialise_ `classeA`

On utilise le mot clefs `extends` pour cela

```js
// la Classe Developer hérite de la classe Person
class Developer extends Person {
  constructor(firstName, age, friends, isDev, languages, github) {
    super(firstName, age, friends, isDev)
    this.githubHomePage = github
    this.languages = languages
  }
  push(projectName) {
    console.log(
      `${this.firstName} is pushing code to ${this.githubHomePage}/${projectName}`
    )
  }
  // printInfo override
  printInfo() {
    super.printInfo()
    console.log(`github home page: ${this.githubHomePage}`)
    console.log('languages: ')
    this.languages.forEach((elem) => {
      console.log(`\t${elem}`)
    })
  }
}

const alice = new Developer(
  'Alice',
  27,
  ['Bob', 'Charlie'],
  true,
  ['JS', 'Solidity'],
  'https://github.com/alice'
)

alice.printInfo()
alice.push('projet1')
```

Une classe enfant doit obligatoirement appeler le `constructor` de son parent si ce dernier possède un `constructor`.
Une classe enfant a accès aux données et méthodes de ses parents
Une classe enfant peut `override` une méthode des ses parents.
`super` nous permet d'avoir accès aux propriétés et méthodes des parents.

## getter

Un getter nous permet d'associer une propriété à une fonction.
C'est très pratique lorsque l'on veut récupérer une information qui dépend d'autres informations.  
Dans nos exemples précédents la propriété `isDev` peut être un getter qui retournera `true` si `languages.length > 0` sinon ce getter retournera `false`.
Ainsi nous n'avons plus besoin d'une véritable propriété `isDev`

```js
class Person {
  constructor(firstName, age, friends, languages) {
    this.firstName = firstName
    this.age = age
    this.friends = friends
    this.languages = languages
  }
  learnDev(language) {
    this.languages.push(language)
  }
  printInfo() {
    console.log(`first name: ${this.firstName}`)
    console.log(`age: ${this.age}`)
    console.log(`friends:`)
    this.friends.forEach((elem) => {
      console.log(`\t${elem}`)
    })
    console.log(`is dev: ${this.isDev}`)
  }
  get isDev() {
    return this.languages.length > 0 ? true : false
  }
}

const alice = new Person('Alice', 27, ['Bob', 'Charlie'], [])
console.log(alice.isDev)
alice.learnDev('JS')
console.log(alice.isDev)
```

## static methods

## visibility: public vs private
