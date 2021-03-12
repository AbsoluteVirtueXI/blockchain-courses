# Test de connaissance Javascript

Ces exercices devront tous être pushés sur un repository accessible depuis github.  
Ce repository devra se nommer `exam-js`
Vous devrez fournir ce lien dans le formulaire de rendus d'exercices suivant: https://forms.gle/QNhDencvCBCNSufw7

**Certains exercices vous demandent d'écrire des fonctions dans un fichier. Il faudra évidement tester ces fonctions en les appelant dans votre programme!!. Ces exercices consistent donc à déclarer ces fonctions mais aussi à les appeler pour vérifier leur exécution**

## threeWayLoop.js

Ecrire dans un même fichier `ThreeWayLoop.js`, 3 boucles différentes `for, for-of, forEach` qui effectueront le même traitement.
Ce traitement consistera à afficher tous les éléments d'un tableau de `string` suivis de leur taille.
Par exemple pour le tableau suivant `const tab = ['Alice', 'Bob', 'Charlie', 'Dan', 'Eve']` nous obtiendrons l'affichage suivant 3 fois (1 fois par loop):

```text
Alice, length: 5
Bob, length: 3
Charlie, length: 7
Dan, length: 3
Eve, length: 3
```

## fiveWayLoop.js

Même exercice que précédemment mais ajouter deux boucles `do-while` et `while` pour effectuer le traitement.

## guess.js

Ecrire une fonction `guess` qui prend 2 nombres en paramètres `userGuess` et `secret`.  
Si `userGuess` est inférieur à `secret` la fonction devra **afficher**: `Too small!`  
Si `userGuess` est supérieur à `secret` la fonction devra **afficher**: `Too big!`  
Si `userGuess` est égal à `secret` la fonction devra **afficher**: `You win`

## information.js

Lisez cet exercice entièrement avant de commencer.  
Ecrire une fonction `information` qui prend 3 paramètres:

- un prénom qui sera une `string`
- un nom qui sera une `string`
- un âge qui sera un `number`

Cette fonction devra **afficher** le message suivant en fonction des paramètres:

```js
information('Sofiane', 'Akermoun', 39)
```

affichera:

```text
prenom: Sofiane
nom: Akermoun
age: 39
vous êtes majeur depuis 21 ans
```

```js
information('Alice', 'Liddell', 7)
```

affichera:

```text
prenom: Alice
nom: Liddell
age: 7
vous serez majeur dans 11 ans
```

Pour notre exercice l'âge de la majorité est **18 ans** et ne vous souciez pas de la gestion du singulier/pluriel dans votre affichage.

## average.js

Ecrire une fonction `average` qui prend comme paramètre un tableau de `number` et **retourne** la moyenne de tous les nombres de ce tableau.

## isLeapYear.js

Ecrivez une fonction `isLeapYear` qui prendra comme paramètre un nombre, qui correspondra à une année, et qui **retournera** `true` si l'année est bissextile ou bien `false` si elle ne l'est pas.
D'après wikipedia:

> Depuis l'ajustement du calendrier grégorien, l'année n’est bissextile (comportant 366 jours) que dans l’un des deux cas suivants :
>
>     - si l'année est divisible par 4 et non divisible par 100 ;
>     - si l'année est divisible par 400 (« divisible » signifie que la division donne un nombre entier, sans reste).

Pour calculer le reste d'une division il faut utiliser l'opérateur `%`

## podium.js

Ecrire une fonction `podium` qui prend comme paramètre un tableau de `number` et **affiche** les 3 meilleures notes tel que ci dessous:

```text
1st: 20
2nd: 18
3rd: 14
```

## numberPyramid.js

Ecrire une fonction `numberPyramid` qui prend 1 paramètre qui correspondra à la base de la pyramide.
Cette fonction **affichera** une pyramide dont les motifs pour chaque étage correspondra au numéro de la ligne.

```js
numberPyramid(8)
```

affichera:

```zsh
1
22
333
4444
55555
666666
7777777
88888888
```

```js
numberPyramid(5)
```

affichera:

```text
1
22
333
4444
55555
```

## Difficile: isMagicSquare.js

Un carré magique est un tableau carré dont la somme de chaque rangées, colonnes et diagonales sont égales.
Sur wikipedia vous pouvez obtenir une schéma d'un carré magique: https://fr.wikipedia.org/wiki/Carr%C3%A9_magique_(math%C3%A9matiques)  
Quelques schémas sont aussi disponible ici: https://mathworld.wolfram.com/images/eps-gif/MagicSquares_851.gif

On peut représenter ce carré en javascript avec un tableau de tableaux:

```js
const square = [
  [2, 7, 6],
  [9, 5, 1],
  [4, 3, 8],
]
```

On remarque que la somme des éléments de toutes les lignes, colonnes et 2 diagonales sont égales à 15. Donc c'est un carré magique.

Ecrivez une fonction `isMagicSquare` qui prendra comme paramètre un tableau de tableaux, comme notre exemple ci dessus, et qui **retournera** `true` si ce tableau correspond à un carré magique sinon `false`.
