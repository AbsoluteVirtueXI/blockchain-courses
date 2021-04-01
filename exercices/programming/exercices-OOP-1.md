# Exercices OOP 1

Ces exercices devront tous être pushés sur un repository accessible depuis github.  
Ce repository devra se nommer `oop-1`.  
Suivez les instructions des cours précédents pour initialiser votre répertoire de travail en package Node.js avec `yarn init`.  
Vous devrez fournir le lien de votre repo github dans le formulaire de rendus d'exercices suivant: https://forms.gle/hodtGoSpJuqireE89
Essayez d'aller le plus loin possible.  
Certains exercices nécessitent une réflexion approfondie prenez votre temps pour anticiper les différentes étapes que devra traiter votre programme.

## info.js

Créer un `object literal` `alice` qui contiendra les informations suivantes:

- firstName: 'Alice'
- lastName : 'Liddell'
- age: 28

Dans le même fichier créer `object literal` `bob` qui contiendra les informations suivantes:

- firstName: 'Bob'
- lastName: 'Lemon'
- age: 30

Dans le même fichier créer `object literal` `charlie` qui contiendra les informations suivantes:

- firstName: 'Charlie'
- lastName: 'Charlot'
- age: 8

## info.js

Améliorer le programme précédent en ajoutant les fonctionnalités ci dessous.
Créer une fonction `printInfo` qui prendra un objet en paramètre et qui affichera sur la console les informations concernant `alice`, `bob` ou `charlie`

## info.js

Améliorer le programme précédent en ajoutant les fonctionnalités ci dessous.
Créer une fonction `canVote` qui prendra un objet en paramètre et qui retourne `true` si la personne peut voter ou `false` sinon.  
Par exemple `canVote(alice)` retournera `true` et `canVote(charlie)` retournera false.  
La majorité est à 18 ans.

## info.js

Améliorer le programme précédent en ajoutant les fonctionnalités ci dessous.
Faites preuve d'imagination et ajouter à chacun des objets une propriété `language` qui sera un tableau de `string` qui contiendra la liste de tous les langages de programmation que Alice, Bob et Charlie connaissent.

## info.js

Améliorer le programme précédent en ajoutant les fonctionnalités ci dessous.
Ecrivez une fonction `mostSkilledDev` qui prendra comme paramètre 2 objets, parmi `alice`, `bob` et `charlie` et qui retournera le `firstName` de la personne qui connait le plus de langages de programmation.  
En cas d'égalité `draw` sera retourné.

## classInfo.js

Traduire votre script _info.js_ pour utiliser une classe, et donc des instances de classes, au lieu `object literals`.

- la classe devra se nommer `Human`
- il faudra un constructeur qui initialisera donc `firstName`, `lastName`, `age`, et `language`
- les fonctions `printInfo`, `canVote`, `mostSkilledDev` seront désormais des méthodes de cette classe

## point.js

Améliorer la classe `Point` du cours en ajoutant une méthode `distance` pour calculer et retourner la distance entre 2 points.  
La distance entre deux points peut se calculer en consultant: https://fr.wikipedia.org/wiki/Distance_entre_deux_points_sur_le_plan_cart%C3%A9sien  
Pour calculer la racine carrée d'un nombre on utilise directement la méthode `Math.sqrt`:

```js
Math.sqrt(9) // retourne 3
```

Pour mettre au carré une nombre on le multiplie par lui même ou sinon on utilise la méthode `Math.pow`:

```js
Math.pow(3, 2) // retourne 9, c'est a dire 3 au carré
```

## Bonnes pratiques

Les classes sont toujours définies dans des fichiers séparées que l'on importe ensuite dans les fichiers ou elles seront utilisées.
En vous servant du cours sur le système de module node.js pour l'import et l'export de modules, créer la classe `Point` dans une fichier _point.js_ qui exportera cette classe.
Ensuite depuis un autre fichier, _main.js_ par exemple, vous importerez la classe `Point` que vous utiliserez.
par exemple _main.js_:

```js
const { Point } = require('./point')
const p1 = new Point(10, 12)
```

Faites de même avec l'exercice `classInfo.js`.

Ainsi on se retrouve avec un code source plus maintenable.
