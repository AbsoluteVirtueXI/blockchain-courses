# Exercices javascript

Vous devez mettre tous les exercices dans 1 unique repository qui est accessible depuis github.  
Créer un nouveau repo sur github et utilisez l'utilitaire `djinit` pour créer le repo en local sur votre machine: [instruction](https://github.com/AbsoluteVirtueXI/alyra-courses/blob/master/node/1-node-introduction.md#djinit)

Créer 1 fichier par exercice (ex01.js, ex02.js, ..etc) que vous enregistrerez sous le repertoire `src/` de votre repository.

Pour certains exercices il vous faudra ecrire une fonction, n'hesitez pas à appeller cette fonction en bas de votre code source et/ou d'utiliser `console.log` pour vérifier si le résultat est celui attendu.

## **ex01.js**:

Ecrivez un programme qui affiche tous les nombres de 0 à 100.

## **ex02.js**

Ecrivez un programme qui affiche tous les nombres de 100 à 0 avec un interval de 2 entre chaque nombre.
L'output du programe:

```zsh
100
98
96
94
..etc
4
2
0
```

## **ex03.js**

Ecrivez une fonction `count` qui prend comme paramètre un nombre `min`, un nombre `max` et un nombre `step`.
L'execution de cette fonction devra afficher sur le terminal tous les nombres de `min` jusqu'a `max` avec un interval de `step`

## **ex04.js**:

Ecrivez un programme dont l'ouput est:

```zsh
*
**
***
****
*****
******
*******
```

## **ex05.js**:

Ecrivez une fonction `showStars` qui prend en paramètre un nombre `nbStars` et qui affiche sur le terminal comme suit:

```js
showStars(3)
```

output:

```zsh
*
**
***
```

<br /><br />

```js
showStars(10)
```

output:

```zsh
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

## **ex06.js**:

Ecrivez 4 fonctions `add`, `sub`, `mul`, `div` qui prennent 2 nombres en paramètres et qui retournent le resultat de l'operation attendue.

```js
let nb1 = add(10, 11) // nb1 === 21
let nb2 = sub(6, 4) // nb2 === 2
let nb3 = mul(4, 5) // nb3 === 20
let nb4 = div(10, 2) // nb4 === 5
```

## **ex07.js**:

En partant de l'exercice précédent ecrivez une fonction `calc` qui prend 3 paramètres: 1 string qui correspondra à l'opérateur arithmétique et 2 nombres sur lesquels on appliquera l'opérateur.
La fonction `calc` devra utiliser les fonctions définies dans l'exercice précédent.

```js
let nb1 = calc('+', 10, 11) // nb1 === 21
let nb2 = calc('-', 6, 4) // nb2 === 2
let nb3 = calc('*', 4, 5) // nb3 === 20
let nb4 = calc('/', 10, 2) // nb4 == 5
```

## **ex08.js**:

Ecrivez une fonction `isPalindrome` qui prend une string en paramètre. Cette fonction retourne `true` si le paramètre est un palindrome sinon retourne `false`

```js
isPalindrome('tenet') // retruns true
isPalindrome('Alyra') // returns false
```

## **ex09.js**:

Ecrivez une fonction `biggest` qui retourne le plus grand élément d'une liste de nombre.

```js
biggest([99, 100, 101, 1]) // returns 101
```

## ** ex10.js**:

Ecrivez une fonction `sortAscend` qui prend comme paramètre une liste et classe cette list par ordre croissant.

```js
sortAscend([99, 100, 101, 1]) // returns [1, 99, 100, 101]
```

## ** ex11.js**:

Ecrivez une fonction `makeUnique` qui prend comme paramètre une liste et enlève tous les doublons, et retourne cette cette liste classée par ordre croissant.

```js
makeUnique([1, 2, 1, 3, 2, 4, 5, 7, 5, 1]) //returns [1, 2, 3, 4, 5, 7]
```

## ** ex12.js**:

un garagiste vous demande de compter le nombre de roues qu'il y a dans son garage.  
Les roues sont toutes montées sur des véhicules de types:  
`monocyle`: 1 roue  
`moto`: 2 roues  
`voiture`: 4 roues  
`limousine`: 6 roues  
Ecrivez une fonction `countWheels` qui prend 4 parmètres, qui correspondent au nombre de chaques véhicules et qui retourne le nombre de roues totales:

```js
countWheels(10, 20, 7, 2) //returns 90
countWheels(2, 3, 4, 5) // returns 54
```

les arguments de la fonction doivent être passés dans l'ordre suivant:

```js
countWheels(nb_monocycle, nb_moto, nb_voiture, nb_limousine)
```

## **ex13.js**:

Ecrivez un programe qui affiche tous les nombres de 0 à 1000 en utilisant une fonction récursive.  
Vous devez absolument utiliser une fonction récursive pour résoudre ce problème.
Une fonction récursive est une fonction qui s'appelle elle même. [explication](https://www.google.com)

## **ex14.js**:

Un industriel vous demande un programe pour gérer ses distributeurs de boissons installés dans tous les métro de France.
Ecrivez une fonction qui prend comme paramètre une somme en Euro et un code d'identification de boisson, par example: 1 pour eau, 2 pour soda, 3 pour café, 4 pour thé, etc... et essayez d'implementer le processus d'achat d'une boisson depuis cet automate.
Faites preuve d'imagination.
