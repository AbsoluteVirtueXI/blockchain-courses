# Exercices loops and iterations

Ces exercices devront tous être pushés sur un repository accessible depuis github.  
Ce repository devra se nommer `exo-loops-iterations`
Vous devrez fournir ce lien dans le formulaire de rendus d'exercices suivant: https://docs.google.com/forms/d/e/1FAIpQLSc6C1su3FLwG1ESO4PfhWLjnOUe8dngO7Ddvx3Md9s2X55M5w/viewform

Essayez d'aller le plus loin possible.  
Les exercices qui nécessitent une réflexion approfondie sont sous la section: **Challenge**

## loop1.js

Avec une boucle `while` afficher les éléments du tableau suivant, ligne par ligne:

```js
let tab = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

## loop2.js

Avec une boucle `do-while` afficher les éléments du tableau suivant, ligne par ligne:

```js
let tab = ['a', 'b', 'c', 'd', 'e']
```

## loop3.js

Avec une boucle `for` afficher les éléments du tableau suivant, ligne par ligne:

```js
let tab = ['Alice', 'Bob', 'Craig', 'Dan', 'Eve']
```

## loop4.js

Avec une boucle `for-of` afficher les éléments du tableau suivant, ligne par ligne:

```js
let tab = ['Js', 'Solidity', 'Html', 'Css', 'Python', 'Java', 'C++', 'Rust']
```

## loop5.js

Avec la méthode `forEach` afficher les éléments du tableau suivant, ligne par ligne:

```js
let tab = ['map', 'filter', 'forEach', 'reduce', 'every']
```

## threeWayCountDown.js

Ecrire avec 3 boucles différentes, un décompte de 101 à 1 en décomptant de 2 en 2:
L'affichage attendu:

```text
101
99
97
95
....
5
3
1
```

## onlyMultipleOf3And7.js

En vous inspirant de l'un des exemple du cours d'aujourd'hui sur les boucles, écrire un programme qui n'affiche que les multiples de 3 et 7 entre 1 et 1000. L'opérateur `%` peut vous aider à trouver si un nombre est multiple d'un autre.

## sumAll2D.js

Ecrivez un programme qui affiche la somme de tous les nombres présents dans ce tableau (qui contient des tableaux)

```js
let tab = [
  [1, 2, 3],
  [4, -5, 7],
  [-3, -6],
  [10, -13],
]
```

## sumAll3D.js

Ecrivez un programme qui affiche la somme de tous les nombres présents dans ce tableau (qui contient des tableaux)

```js
let tab = [
  [
    [1, 7, 3],
    [11, 17, 7],
    [-3, -5],
    [5, 13],
  ],
  [
    [2, 4, 6, 8, 10],
    [1, 3, 5],
  ],
  [[0]],
  [[0], [1], [2], [1]],
]
```
