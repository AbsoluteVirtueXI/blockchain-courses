# Exercices functions

Ces exercices devront tous être pushés sur un repository accessible depuis github.  
Ce repository devra se nommer `exo-functions`
Vous devrez fournir ce lien dans le formulaire de rendus d'exercices suivant: https://docs.google.com/forms/d/e/1FAIpQLSc6C1su3FLwG1ESO4PfhWLjnOUe8dngO7Ddvx3Md9s2X55M5w/viewform

Essayez d'aller le plus loin possible.  
Les exercices qui nécessitent une réflexion approfondie sont sous la section: **Challenge**

**Ces exercices vous demandent d'écrire des fonctions dans un fichier. Il faudra évidement tester ces fonctions en les appelant dans votre programme!!. Les exercices consistent donc à déclarer ces fonctions mais aussi à les appeler pour vérifier leur exécution**

## count.js

Ecrire une fonction `count` qui prend comme paramètre un nombre min, un nombre max et un nombre step. L'exécution de cette fonction devra afficher sur le terminal tous les nombres de min jusqu'a max avec un intervale de step

## typeOf.js

Ecrire une fonction `typeOf` qui prend comme paramètre une variable, et qui retourne une string qui sera le nom du type de cette variable passée en paramètre. Vous devrez utiliser l'opérateur `typeof` pour cela

## pyramid.js

En vous inspirant de la fonction `showStars` vue en cours, Ecrire une fonction `pyramid` qui prend 3 paramètres:

- le nombre d'éléments qui sera la base de la pyramide
- un boolean pour vérifier si la pyramide sera générée à l'envers ou à l'endroit
- une string (un caractère) qui sera le motif à afficher contrairement à l'exemple du cours qui affiche par défaut le caractère `*`.

## parity.js

Ecrire une fonction `isOdd` qui prend un nombre en paramètre et qui devra retourner `true` si le nombre passé en paramètre est impair, sinon la fonction retournera `false`.

## parity.js

Ajouter au fichier précédent une fonction `isEven` qui prend un nombre en paramètre et qui devra retourner `true` si le nombre passé en paramètre est pair, sinon la fonction retournera `false`.  
la fonction `isEven` devra **absolument** utiliser la fonction `isOdd` pour effectuer sa vérification de parité.

## stringUtils.js

Ecrire une fonction `reverseStr` qui prend en paramètre une string et qui retourne cette string inversé.
Si le paramètre passé est 'Hello!' la fonction devra retourné '!olleH'

## stringUtils.js

Ajouter au fichier précédent une fonction `isPalindrome` qui prend une string en paramètre et qui retourne `true` si la string est un palindrome, sinon la fonction devra retourner `false`.
Vous devrez utiliser la fonction `reverseStr` pour effectuer cette vérification.

## convertMiToKm.js

Ecrire une fonction `convertMiToKm` qui fait la conversion d'une distance exprimée en Milles, en Kilomètres.
1 Mille est à égal à 1.60934 Kilomètres.

## arrayUtils.js

Ecrivez une fonction `biggest` qui retourne le plus grand élément d'une liste de nombre.

```js
biggest([99, 100, 101, 1]) // returns 101
```

## arrayUtils.js

Ajouter au fichier précédent une fonction `sortAscend` qui prend comme paramètre une liste de nombres et retourne une nouvelle liste dont les nombres sont classés par ordre croissant.

```js
sortAscend([99, 100, 101, 1]) // returns [1, 99, 100, 101]
```

## arrayUtils.js

Ajouter au fichier précédent une fonction `makeUnique` qui prend comme paramètre une liste de nombre et retourne une nouvelle liste sans doublons, classée par ordre croissant.

```js
makeUnique([1, 2, 1, 3, 2, 4, 5, 7, 5, 1]) //returns [1, 2, 3, 4, 5, 7]
```

## calc.js

Ecrire une fonction `add` qui prend 2 paramètres et qui devra retourner la somme des 2 paramètres.

## calc.js

Ajouter au fichier précédent une fonction `sub` qui prend 2 paramètres et qui devra retourner la soustraction des 2 paramètres.

## calc.js

Ajouter au fichier précédent une fonction `mul` qui prend 2 paramètres et qui devra retourner la multiplication des 2 paramètres.

## calc.js

Ajouter au fichier précédent une fonction `div` qui prend 2 paramètres et qui devra retourner la division des 2 paramètres.

## calc.js

Ajouter au fichier précédent une fonction `calc` qui prend 3 paramètres:

- un caractère parmi les 4 suivants: `+`, `-`, `*`, `/`. Ces caractères détermineront l'opération de calcul à effectuer.
- un premier nombre
- un deuxième nombre

En fonction du caractère passé en paramètre, l'opération de calcul correspondante devra être appliquée aux 2 autres paramètres, et le résultat sera retourné
Vous devrez absolument vous servir des 4 fonctions `add`, `sub`, `mul` et `div` écrites précédemment.

## countWhells.js

un garagiste vous demande de compter le nombre de roues qu'il y a dans son garage.
Les roues sont toutes montées sur des véhicules de types:
monocycle: 1 roue
moto: 2 roues
voiture: 4 roues
limousine: 6 roues
Ecrivez une fonction `countWheels` qui prend 4 paramètres, qui correspondent au nombre de chaque véhicules et qui retourne le nombre de roues totales:

```js
countWheels(10, 20, 7, 2) //returns 90
countWheels(2, 3, 4, 5) // returns 54
```

les arguments de la fonction doivent être passés dans l'ordre suivant:

```js
countWheels(nb_monocycle, nb_moto, nb_voiture, nb_limousine)
```

## forEach.js

Ecrire une fonction `forEach`qui devra effectuer la même opération que la méthode `.forEach`: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach
La fonction `forEach` devra appliquer une fonction passée en paramètre à chacun des éléments d'un tableau passé en paramètre aussi à la fonction `forEach`

## filter.js

Ecrivez une fonction `filter` qui devra effectuer la même opération que la méthode `.filter`: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter
La fonction `filter` devra retourner un nouveau tableau dont tous les éléments passent le test implémenté dans une fonction passé en paramètre à un tableau passé en paramètre aussi à la fonction `filter`.
