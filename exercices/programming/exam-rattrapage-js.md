# Rattrapage test de connaissance Javascript

Ces exercices devront tous être pushés sur un repository accessible depuis github.  
Ce repository devra se nommer `exam-rattrapage-js`
Vous devrez fournir ce lien dans le formulaire de rendus d'exercices suivant: https://forms.gle/QNhDencvCBCNSufw7

**Certains exercices vous demandent d'écrire des fonctions dans un fichier. Il faudra évidement tester ces fonctions en les appelant dans votre programme!!. Ces exercices consistent donc à déclarer ces fonctions mais aussi à les appeler pour vérifier leur exécution**

## threeWayLoop.js

Ecrire dans un même fichier `ThreeWayLoop.js`, 3 boucles différentes `for, for-of, forEach` qui effectueront le même traitement.
Ce traitement consistera à afficher tous les éléments d'un tableau de `string` **A L'ENVERS** (cad en partant de la fin) suivis de leur taille et de leur index dans le tableau.
Par exemple pour le tableau suivant `const tab = ['Alice', 'Bob', 'Charlie', 'Dan', 'Eve']` nous obtiendrons l'affichage suivant 3 fois (1 fois par loop):

```text
Eve, length: 3, index: 4
Dan, length: 3, index: 3
Charlie, length: 7, index: 2
Bob, length: 3, index: 1
Alice, length: 5, index: 0
```

## fiveWayLoop.js

Même exercice que précédemment mais ajouter deux boucles `do-while` et `while` pour effectuer le traitement.

## information.js

Lisez cet exercice entièrement avant de commencer.  
Ecrire une fonction `information` qui prend 4 paramètres:

- un prénom qui sera une `string`
- un nom qui sera une `string`
- un âge qui sera un `number`
- une sexe qui sera une string parmi `M`, `F`, `?`

Cette fonction devra **afficher** le message suivant en fonction des paramètres:

```js
information('Sofiane', 'Akermoun', 39, 'M')
```

affichera:

```text
prenom: Sofiane
nom: Akermoun
age: 39
Monsieur, vous êtes majeur depuis 21 ans
```

```js
information('Alice', 'Liddell', 7, 'F')
```

affichera:

```text
prenom: Alice
nom: Liddell
age: 7
Madame, vous serez majeur dans 11 ans
```

```js
information('Valerie', 'Dupont', 7, '?')
```

affichera:

```text
prenom: Valerie
nom: Dupont
age: 7
vous serez majeur dans 11 ans
```

Pour notre exercice l'âge de la majorité est **18 ans** et ne vous souciez pas de la gestion du singulier/pluriel dans votre affichage.

## sumAll.js

Ecrire une fonction `summAll` qui prend comme paramètre un tableau de `number` et **retourne** la somme de tous les nombres de ce tableau.

## isEven.js

Ecrire une fonction `isEven` qui prend un nombre en paramètre et qui devra retourner `true` si le nombre passé en paramètre est pair, sinon la fonction retournera `false`.

## convertEuroToDollar.js

Ecrire une fonction `convertEuroToDollar` qui fait la conversion d'une somme exprimée en Euros, en Dollars.
1 euro est égal à 1.18 dollars

## reversePodium.js

Ecrire une fonction `reversePodium` qui prend comme paramètre un tableau de `number` et **affiche** les 3 plus mauvaises notes tel que ci dessous

```text
2
1
0
```
