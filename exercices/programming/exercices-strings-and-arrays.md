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

# Challenge

## decypher.js

le texte suivant est chiffré avec un code Caesar (chiffrement par décalage):

```text
YRMV PFL VMVI YRU R UIVRD EVF KYRK PFL NVIV JF JLIV NRJ IVRC NYRK ZW PFL NVIV LERSCV KF NRBV WIFD KYRK UIVRD YFN NFLCU PFL BEFN KYV UZWWVIVETV SVKNVVE KYV UIVRD NFICU REU KYV IVRC NFICU
```

Le but de cet exercice est de vous mettre dans la peau d'un cryptanalyste qui devra casser ce chiffrement Caesar.  
La méthode manuelle est évidement la pire de toute et n'est pas une solution valide.
En vous servant de Javascript essayez de casser ce code.  
Une interaction manuelle est possible, le but n'étant pas de déchiffrer ce code de manière totalement automatique, car pour bien le faire il vous faudrait un dictionnaire de mots.  
On attend de vous que vous minimalisiez les interactions manuelles pour déchiffrer ce code.
Vous devrez rendre les codes que vous avez utilisez dans un fichier _decypher.js_ et ecrire en commentaire vos démarches et les différentes étapes que vous avez suivi pour obtenir le message en clair.
**Hypothèses**:

- le message est en anglais
- Toutes les lettres sont en majuscules
- Il n'y a pas de ponctuation
- Les espaces dans le message chiffré sont aussi des espaces dans le message non chiffré

**Indices**:

- on peut récupérer le code ascii d'un caractères avec la méthode `.charCodeAt([index])`

```js
'HELLO'.charCodeAt(0) // code ascii du caractère à l'index 0 => H: 72
'HELLO'.charCodeAt(1) // code ascii du caractère à l'index 1 => E: 69
```

- pour faire l'inverse et traduire un code ascii en caractère:

```js
String.fromCharCode(72) // String qui comporte 1 caractère: 'H'
String.fromCharCode(69) // String qui comporte 1 caractère: 'E'
```
