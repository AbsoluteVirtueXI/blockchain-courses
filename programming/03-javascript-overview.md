# Javascript overview

## **Commentaires**

```js
/*  
    Un commentaire qui s'etend
    sur plusieures lignes
*/

// un commentaire sur une seule ligne
// un autre commentaire sur une seule ligne
```

## **Types de données**

5 data types in javascript:

```js
let nb = 7 // a number: an integer
let pi = 3.14 // a number: a float
let msg = 'Hello Alyra' // a string
let isStarted = true // a boolean
let isFinished = false // un booléen
let nothing = null // something null
let something // undefined
```

Le type de données définit les opérations que l'ont peut effecuter sur cette donnée.

## **Variables**

```js
let age = 13 // declare the age variable with the value 13
const MAX_USER = 255 // declare a constant
```

## **Conditions**

### **if / else if /else**

```js
let age = 20
// si age < 18 alors:
if (age < 18) {
  console.log('Vous êtes mineur.')
  // sinon si 18 <= age <= 65 alors:
} else if (age <= 65) {
  console.log('Vous êtes majeur.')
  // sinon c'est que age est > 65
} else if (age < 100) {
  console.log('Vous êtes senior.')
  // sinon
} else {
  console.log('Vous êtes centenaire')
}
```

### **ternary operator**

La structure de controle basique **if-else** est si commune qu'un raccourci syntaxique a été créé:

```js
let age = 7
if (age >= 18) {
  console.log('Vous êtes majeur.')
} else {
  console.log('Voues êtes mineur.')
}
// est equivalent à:
age >= 18 ? console.log('Vous êtes majeur.') : console.log('Vous êtes mineur.')
```

### **switch**

```js
let language = 'javascript'
let msg = ''
switch (language) {
  case 'html':
    msg = 'good for web dev.'
    break
  case 'javascript':
    msg = 'good for everything.'
    break
  case 'solidity':
    msg = 'good for smart contracts dev.'
    break
  default:
    msg = 'i have no idea about this language.'
    break
}
console.log(`${language}: ${msg}`)
```

## **Boucles**

### **while: _Tant que faire_**

```js
let counter = 10
// tant que counter est strictement supérieur à 0
while (counter > 0) {
  // afficher la valeur de counter
  console.log(counter)
  // decrementer counter de 1
  counter -= 1
}
```

### **do-while: _Faire tant que_**

```js
let counter = 10
// faire:
do {
  // afficher le valeur de counter
  console.log(counter)
  //decrementer counter de 1
  counter -= 1
} while (counter > 0) // tant que counter est > 0
```

### **for: _Pour tout element_**

Dans les cas ou un _counter_ est nécessaire pour tracker la progression de la boucle et qu'une condition vérifie si le _counter_ a atteint sa valeure finale pour continuer à itérer, la boucle `for` est une manière plus élégante de créer une boucle:

```js
// Pour tous les élements de 10, jusqu'a
// 0 (0 non inclus)
for (let counter = 10; counter > 0; counter -= 1) {
  console.log(counter)
}
```

### **break**

L'instruction `break` permet de sortir d'une boucle sans attendre que la condition de la boucle soit `false`.

```js
let counter = 0
while (true) {
  console.log(counter)
  counter += 1
  if (counter === 100) {
    break
  }
}
```

### **continue**

L'instruction `continue` permet de continuer la boucle sans attendre la fin de l'itération actuelle

```js
// Afficher tous les nombres impairs entre 0 et 99
for (let i = 0; i < 100; i += 1) {
  // si i est pair alors:
  if (i % 2 === 0) {
    continue // arrêter l'itération actuelle et passer à la suivante
  }
  console.log(i)
}
```

## **functions**

```js
// Definition de la fonction add qui prend 2 paramètres
const add = (nb1, nb2) => {
  return nb1 + nb2
}
// Appel de la fonction
let sum = add(11, 13) // sum === 24

// Definition de la fonction sayHello avec 2 paramètres optionnels
const sayHello = (from = 'i', to = 'you') => {
  return `${from} says hello to ${to}`
}
console.log(sayHello()) // print: 'i says hello to you'
console.log(sayHello('alice')) // print: 'alice says hello to you'
console.log(sayHello('alice', 'bob')) // print: 'alice says hello to bob'
```

## **Scope**

```js
let x = 10
if (true) {
  let y = 20
  var z = 30
  console.log(x + y + z)
  // → 60
}
// y is not visible here
console.log(x + z)
// → 40
```

```js
const halve = (n) => {
  return n / 2
}

let n = 10
console.log(halve(100))
// → 50
console.log(n)
// → 10
```

## **Arrays & strings**

```js
let list = [1, 2, 3]
console.log(list[0]) // print: 1
let movies = ['batman', 'inception', 'interstellar']
movies.push('tenet')
let nb_movies = movies.length // nb_movies === 4
```

### **iterating over arrays**

**old way**:

```js
let movies = ['batman', 'inception', 'interstellar', 'tenet']
for (let index = 0; index < movies.length; index += 1) {
  console.log(movies[index])
}
```

**new way**:

```js
let movies = ['batman', 'inception', 'interstellar', 'tenet']
for (let elem of movies) {
  console.log(elem)
}
```

**Use whenever possible**:

```js
// forEach: "Pour chaque élements d'une liste faire:"
;['coffe', 'tea', 'water', 'soda', 'beer'].forEach((elem, index) => {
  console.log(`elem: ${elem} is at index: ${index}`)
})
```

```js
// map: "Pour chaque élements d'une liste appliquer une fonction:"
let double = [1, 2, 3].map((elem) => {
  return elem * 2
})
console.log(double) // print: [2, 4, 6]
```

```js
// filter: "Filtrer tous les élements d'un tableau en fonction d'une condition"
let odds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].filter((elem) => {
  return elem % 2 !== 0
})
console.log(odds)
```

Il y en a d'autres: `every`, `find`, `findIndex`
