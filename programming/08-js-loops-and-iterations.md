# Loops and iterations in javascript

## while

La boucle `while` exécute son block d'instruction tant qu'une condition est vraie.

```js
let n = 0
while (n < 3) {
  n++
}
console.log(n)
```

## do-while

Contrairement à une boucle `while`, la boucle `do-while` exécute au moins une fois son block d'instructions et tant que sa condition est vraie.

```js
let result = ''
let i = 0
do {
  i = i + 1
  result = result + i
} while (i < 5)
console.log(result)
```

## for

Une boucle `for` se répète tant qu'une condition est vraie.

```js
for ([initialExpression]; [conditionExpression]; [incrementExpression])
  statement
```

Les étapes lors d'une itération avec une boucle `for`:

1. L'expression `initialExppresion` est exécutée. Cette expression initialise en général les compteurs de la boucle.
2. `conditionExpression` est évaluée. Si `true` alors le block de la boucle `for` est exécutée, si `false` la boucle `for` se termine.
3. `statement` est exécuté. Si il y a plusieurs `statement` dans une boucle `for` il faut les mettre entre `{}` pour créer un `block statement`.
4. Si présente, l'expression `incrementExpression` est exécutée
5. Le flow d'exécution retourne à l'étape 2.

On peut déclarer plus d'une variable dans l'expression d'initialisation et dans l'expression d'incrementation:

```js
for (let i = 0, j = 10; i !== j; ++i, --j) {
  console.log(`i = ${i}, j = ${j}`)
}
```

## Iterating over Iterables (string, array)

### for...of

La boucle `for...of` permet d'itérer sur des `iterable objects`.
Sans entrer dans le détails, les `iterable objects` comprennent les `string` et les `array`.  
L'avantage c'est que la boucle `for...of` se passe d'une expression d'initialisation et d'une expression d'incrémentation.
Le but de cette boucle est d'itérer du début de notre liste jusqu'a la fin, à moins que l'on `break` pour en sortir.

```js
for (const elem of [1, 2, 3, 4, 5]) {
  console.log(elem)
}
```

### forEach pour les arrays

La méthode `.forEach` exécute une fonction pour chaque éléments d'un tableau.

```js
;[1, 2, 3, 4, 5].forEach((elem) => {
  console.log(elem)
})
```

On ne peut pas `break` ou `continue` dans la fonction qui est passée en paramètre de la méthode `forEach`.

## Nested loops

Des boucles, aussi bien `while`, `do-while`, `for` peuvent être imbriquées:

```js
// Il faut afficher un par un tous les élements des tableaux de names
let names = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
] // un tableau de tableau
for (let i = 0; i < names.length; ++i) {
  console.log(`Array ${i + 1}:`)
  for (let j = 0; j < names[i].length; ++j) {
    console.log(`\t${names[i][j]}`)
  }
}
```

```js
// Affichage des tables et des clients d'un restaurant.
let tables = [
  ['Alice', 'Bob'],
  ['Craig', 'Eve', 'Ginette'],
  ['Sofiane', 'Franck', 'Paulina', 'Maxime'],
]

let nbUsers = 0
for (let i = 0; i < tables.length; ++i) {
  nbUsers += tables[i].length
}
console.log(`Today, nb users = ${nbUsers}`)

for (let i = 0; i < tables.length; ++i) {
  console.log(`Table ${i + 1}: `)
  for (let j = 0; j < tables[i].length; ++j) {
    console.log(`\t${tables[i][j]}`)
  }
}
```

## break

On peut sortir d'une boucle avec le `statement` `break`.

```js
for (let i = 0; i < 10; ++i) {
  if (i === 5) {
    break
  }
  console.log(i)
}
```

## continue

On peut stopper l'itération en cours et passer à la suivante avec le `statement` `continue`.

```js
// N'affiche que les nombres impairs en 0 et 20
for (let i = 0; i <= 20; ++i) {
  if (i % 2 === 0) {
    continue
  }
  console.log(i)
}
```

## recursion

Maybe you are not ready yet...
