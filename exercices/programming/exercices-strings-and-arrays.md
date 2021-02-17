# Exercices strings and arrays

Ces exercices devront tous être pushés sur un repository accessible depuis github.  
Ce repository devra se nommer `exo-strings-arrays`
Vous devrez fournir ce lien dans le formulaire de rendus d'exercices suivant: https://docs.google.com/forms/d/e/1FAIpQLSc6C1su3FLwG1ESO4PfhWLjnOUe8dngO7Ddvx3Md9s2X55M5w/viewform

Essayez d'aller le plus loin possible.  
Les exercices qui nécessitent une réflexion approfondie sont sous la section: **Challenge**

# Exercice 1

Appliquer les corrections de ce matin à vos exercices précédents.
Lisez/relisez le cours sur les strings et lire l'article:  
https://www.digitalocean.com/community/tutorials/how-to-index-split-and-manipulate-strings-in-javascript

**Pour tous exercices qui suivent, il faudra utiliser les méthodes accessibles aux données de type `string`**

## check.js

Vérifier si dans le texte suivant le mot `Javascript` est présent:

```text
JS, ECMAScript, esm6 peuvent être considérés comme des alias de Javascript
```

## replace1.js

Ecrivez un programme qui remplace `Sofiane` par votre prénom.

```text
Bonjour, je suis Sofiane.
```

Afficher le nouveau message

## replace2.js

Ecrivez un programme qui remplace toutes les occurrences `Alice` par votre propre prénom dans le texte suivant.

```text
In cryptography, Alice and Bob are fictional characters commonly used as placeholders in discussions about cryptographic protocols or systems.
As the use of Alice and Bob became more widespread, additional characters were added, sometimes each with a particular meaning.
The most common characters are Alice and Bob. Eve, Mallory, and Trent are also common names.
```

Afficher le texte avec les nouvelles modifications

## countWords.js

En vous aidant de la méthode `.split()` compter tous les mots du sonnet "El Desdichado" des exercices précédents
_Appliquée à une `string` la méthode `.split()` retourne un tableau_

## sanitize.js

la `string` suivante est difficilement lisible:

```js
let str =
  '\n\n\t\t    AlIcE eT bOb EsSaYeNt De CoMmUnIqUeR sEcReTeMeNt, MaIs EvE vEiLlE  \n\n '
```

Avec un programme, afficher cette phrase en réglant les problèmes d'espaces et passages à la ligne inutiles, et aussi de casse (Mettez tout en minuscule ou majuscule).

## findBob.js

En utilisant le code écrit précédemment écrivez un nouveau programme dans un fichier `findBob.js` qui nous affichera si l'occurence "Bob" est présente.  
La casse n'est pas importante.

## translate.js

Ecrivez d'une maniere différente ce programme:

```js
let str =
  '\n\n\t\t    AlIcE eT bOb EsSaYeNt De CoMmUnIqUeR sEcReTeMeNt, MaIs EvE vEiLlE  \n\n '

str
  .trim()
  .toUpperCase()
  .split(' ')
  .forEach((elem) => console.log(`mot: ${elem}`))
```
