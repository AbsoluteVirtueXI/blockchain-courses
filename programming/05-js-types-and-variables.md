# Data types and variables in Javscript

## Data types

Javascript met à notre dispositions 8 types de données/valeurs prédéfinis dans le core du langage.  
On appelle ces types des `built-in` types, ils sont intégrés directement dans le langage JS.
Certains de ces types sont considérés comme `primitive`, ce sont des types de bases, les autres sont considérés comme `compound`/`Object`, c'est à dire que ce sont des types qui peuvent être ou sont composés d'autres types.  
On peut aussi créer nos propres types pour nos données, qui seront en réalité des objets donc de catégorie `compound`.  
L'importance des types des données en programmation est importante.  
En fonction du type de nos données, les opérateurs que l'on appliquera sur nos données n'auront pas le même effet:

```js
3 + 5 // addition de 2 numbers
'Hello' + ' world' // concaténation de 2 strings
17 - 5 // soustraction de 2 numbers
'Bonjour HardFork' - 'HardFork' // l'opérateur '-' n'est pas implementé pour des strings
```

L'exemple ci dessus démontre que l'opérateur `+` et `-` n'agissent pas de la même manière en fonction du type de leurs opérandes.

Toutes les données ont un type.
Que la donnée soit littérale ou dans une variable elle possède un type.
**Faites l'effort de connaitre le type de vos données lorsqu'elles seront stockées dans vos variables. Cela vous évitera de nombreux bugs**

### Primitive Types

Les types de bases en JS. Ils sont atomiques.
La particularité des `primitive types` c'est qu'ils sont `immutables`.
C'est à dire que les valeurs dont le type est de la catégorie `primitive types` ne peuvent être modifiées.

```js
let x = 10
++x // ici on ne modifie pas 10, on réasigne à x une nouvelle valeur qui est 11

const increment = (n) => {
  return (n = n + 1)
}

const addMovie = (list, elem) => {
  list.push(elem)
}

// n is immutable
let n = 10
increment(n)
console.log(n) // output: 10

// movies is mutable
let movies = ['The Prestige', 'Batman', 'Incepetion', 'Interstellar']
addMovie(movies, 'Tenet')
console.log('movies') // output:
```

#### Undefined type

`undefined` est la valeur qui est automatiquement assignée aux variables qui ne sont pas initialisées.

```js
let x // x n'est pas initialisé, il est de type undefined et à pour valeur undefined...
console.log(typeof x) // undefined
console.log(x) // undefined
```

#### Null type

les données de type null ne peuvent posséder qu'une valeur qui est `null`.
la valeur `null` représente l'absence intentionnelle de valeur.
Si possible, éviter d'assigner `null` à vos variables.

> I call it my billion-dollar mistake. It was the invention of the null reference in 1965. At that time, I was designing the first comprehensive type system for references in an object oriented language (ALGOL W). My goal was to ensure that all use of references should be absolutely safe, with checking performed automatically by the compiler. But I couldn't resist the temptation to put in a null reference, simply because it was so easy to implement. This has led to innumerable errors, vulnerabilities, and system crashes, which have probably caused a billion dollars of pain and damage in the last forty years.
>
> -- Tony Hoare

#### Boolean type

Le type `boolean` représente une valeur logique.
les valeurs de types `boolean` ne peuvent posséder que les valeurs `true` ou `false`, l'équivalent de `1` ou `0` en binaire.  
En javascript les valeurs de type `boolean` sont souvent utilisées pour décider quelles sections de code à exécuter (avec un `if/else if/else`) ou à répéter (avec une boucle, `do-while/while/for`).

2 branches de code différent en fonction du `boolean` `isOpen`:

```js
let isOpen = false
if (isOpen) {
  console.log('Entrer')
} else {
  console.log('Faire demi tour')
}
```

Le code est répété tant que le `gameOver` est `false`:

```js
// Message d'acceuil
console.log('Welcome to my game')

// Le jeu commence avec gameOver à false
let gameOver = false

// La boucle suivante est executé 60 fois par seconde, 60 FPS.
// Tant qu'il n'y a pas game over continuer le jeu
while (!gameOver) {
  // Récupérer les inputs du joueur: clavier, souris, pad
  getPlayerJoystickInput()

  // En fonction des inputs récupérés mettre à jour les données du jeu: sauter, gagner, perdre
  // Si une perte est detectée set gameOver à true
  updateGameLogic()

  // Dessiner à l'écran en fonction de la logique du jeu
  drawOnScreen()
}
console.log('Game over')
```

Comme les valeurs de type `number`, qui ont leurs opérateurs arithmétiques, `+`, `-`, `/`, `*`, `%` et `**`, les valeurs de type `boolean` possèdent aussi des opérateurs logiques.
**Binary logical operators:**
`&&`: Logical AND
`||`: Logical OR
`!`: Logical NOT
`??`: [Nullish Coalescing Operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing_operator)

```js
// &&: logical AND operator
false && false // false
false && true // false
true && false // false
true && true // false

// ||: logical OR operator
false || false // false
false || true // true
true || false // true
true || true // true

// !: logical NOT operator
!true // false
!false // true
```

Ces opérations logiques sont représentées dans les tables de vérités suivantes:

**Table de vérité AND classique**:
| a | b | a AND b |
|---|---|---------|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

**Table de vérité `&&` JS**:
| a | b | a `&&` b |
|---|---|---------|
| `false` | `false` | `false` |
| `false` | `true` | `false` |
| `true` | `false` | `false` |
| `true` | `true` | `true` |

**Table de vérité OR classique**:
| a | b | a OR b |
|---|---|---------|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

**Table de vérité `||` JS**:
| a | b | a `||` b |
|---|---|---------|
| `false` | `false` | `false` |
| `false` | `true` | `true` |
| `true` | `false` | `true` |
| `true` | `true` | `true` |

**Table de vérité NOT classique**:
| a | NOT a |
|---|---|
| 0 | 1 |
| 1 | 0 |

**Table de vérité `!` JS**:
| a | !a |
|---|---|
| `false` | `true` |
| `true` | `false` |

Les opérateurs logiques sont normalement utilisés avec des opérandes de type `boolean`.  
Dans ce cas l'`expression` retournera un `boolean`.
Comme ci dessous:

```js
// Booleans definissants la météo actuelle
let isSunny = true
let isCloudy = false
let isRainy = true

// L'expression isCloudy && isRainy est égale à false
if (isCloudy && isRainy) {
  console.log('Please take an umbrella.')
  // L'expression isSunny && isCloudy est égale à false
} else if (isSunny && isCloudy) {
  console.log('There is a danger of sunburn.')
  // L'expression isSunny && isRainy est égale à true
} else if (isSunny && isRainy) {
  console.log('Double rainbow!!')
  // Default case, si aucune des conditions dessus ne match alors...
} else {
  console.log('i do not have an opinion on this kind of weather.')
}
```

Des valeurs de type `boolean` peuvent aussi être obtenues par des expressions comme ci dessous:

```js
// Programme pour vérifier si un user a les capacités de dev un smart contract
let isDev = false
let hasSoliditySkill = false
let hasIndomitableWill = true

/*
  L'expression suivante retourne un boolean:
  isDev && hasSoliditySkill || hasIndomitableWill
  On peut donc utiliser cette expression ou un boolean est attendu
*/
if ((isDev && hasSoliditySkill) || hasIndomitableWill) {
  console.log('You will be a great blockchain developper')
} else {
  console.log('Sorry, but you miss something... Try harder')
}
```

_Nous le verrons plus tard, une expression est une opération qui nous retourne une valeur.
Les opérations arithmétiques, de comparaisons relationnelles ou d'égalité, bit à bit, logiques et même l'appelle de fonction sont des expressions. Et certaines de ces opérations retournent un `boolean`_  
_Nous le verrons également plus tard, mais puisque les opérations logiques sont évaluées de gauche à droite, elles peuvent servir à `short-circuit` l'évaluation d'une expression_

#### Number type

le type `number` représente un nombre entier ou réel/décimal, aussi bien positif que négatif.  
En anglais on les désigne comme `integer` et `float`.
Les `number` peuvent avoir comme valeur maximum `9007199254740991` et comme valeur minimum `-9007199254740991`.

```js
Number.MAX_SAFE_INTEGER // maximum safe value
Number.MIN_SAFE_INTEGER // minimum safe value
```

Les opérateurs arithmétiques classiques peuvent utiliser comme opérandes des `number`:

```js
1 + 10 // addition
1 - 10 // soustraction
50 * 2 // multiplication
50 / 2 // division
12 % 7 // modulo aka reste de la division euclidienne
3 ** 4 // exponetielle: 3 puissance 4
let index = 0
++index // prefix increment
index++ // postfix increment
--index // prefix decrement
index-- // postflix decrement
let balance = 1000
let currentBalance = -balance // unary negation
```

les nombres sont habituellement représentés en base 10, c'est à dire exprimé avec les chiffres de 0 à 10.  
En informatique il peut être utile, et recommendé pour certains cas, d'exprimer les chiffres dans une autre base:
binaire: 2 digits, chiffre 0 et 1 uniquement  
octal: 8 digits, chiffre de 0 à 7 uniquement  
décimal: 10 digits, chiffre de 0 à 9 uniquement  
hexadecimal: 16 digits, chiffre de 0 à 9 et lettres de A à F

```js
123 // representation decimal
42 // representation decimal
1337 // representation decimal
0b1101 // representation en binaire de 13 en décimal
0b11111111 // representation en binaire de 255 en décimal
010 // represenation en octal de 8 en décimal
0777 // reprensation en octal de 511 en décimal
0xdeadface // represenation en hexadecimal de 3735943886 en décimal
0x2a // reprenseation en hexadecimal de 42 en décimal
0x2a + 0b1101 // 42 + 13 =>55

// Testons les égalités entre des represenations / système de numérations différents
if (42 === 0b101010 && 42 === 052 && 42 === 0x2a) {
  console.log('All numbers are equal')
} else {
  console.log('Numbers are not equal')
}
```

Les variables de types `number` ont une méthode `.toString([radix])` qui permet de retourner une chaîne représentant le nombre dans une base numérique (radix) donnée.  
Si aucun radix n'est indiqué alors la base par défaut est la base 10.
_une base se traduit par radix en anglais_

```js
let age = 30
console.log(age.toString(2)) // output: 11110
console.log(age.toString(8)) // output: 36
console.log(age.toString()) // default base 10, output: 30
console.log(age.toString(16)) // output: 1e
```

#### Big Number type

le type `bigint` sert à représenter des valeurs qui vont au delà des limites des valeurs de type `number`.
les valeurs de type `bigint` supportent les mêmes opérateurs que les valeurs de type `number`.

Pour déclarer une valeur de type `bigint`:

```js
let bigNumber1 = BigInt('100000000000000000000000000000000000000000000000')
let bigNumber2 = 100000000000000000000000000000000000000000000000n
let res1 = bigNumber1 + 1n
let res2 = bigNumber2 + BigInt(1)
```

#### String type

Le type `string` représente une suite de caractères, c'est à dire du texte.
Puisque les `string` sont une suite de caractères, chaque caractère de la `string` occupe une position dans cette suite.  
Le premier caractère est à l'index 0, le suivant à l'index 1, etc...  
La longueur de cette string, sa `length`, est le nombre de caractères qu'elle contient.

```js
'Hello World!'

```

#### Symbol type

n/a

### Compound/Object Types

#### Arrays

#### Objects

#### Functions

### type of

## Variables

### Déclaration

Il existe 3 types de variables en javascript.
Elles sont déclarés avec les keywords suivants:
`let`: Déclare une `block-scoped` variable, locale à un scope, on peut optionnellement l'initialiser
`const`: Déclare une `block-scoped` constante. On ne pourra ensuite plus que lire sont contenu. Il faut obligatoirement initialiser une constante.
`var`: Déclare une variable, on peut optionnellement l'initialiser.
Les variables déclarées avec les keywords `var` ou `let` et qui ne sont pas initialisées, auront comme valeur `undefined`.

### Constantes
