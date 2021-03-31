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
  friends: ['Alice', 'Charlive'],
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

const alice = new Person('Alice', 27, ['Bob', 'Charlie'], true)
const bob = new Person('Bob', 30, ['Alice', 'Charlie'], false)
alice.printInfo()
bob.printInfo()
bob.learnDev() // bob is now a dev
bob.printInfo()
```
