# Exercices types and boolean

Ces exercices devront tous être pushés sur un repository accessible depuis github.  
Ce repository devra se nommer `exo-types-boolean`
Vous devrez fournir ce lien dans le formulaire de rendus d'exercices suivant: https://docs.google.com/forms/d/e/1FAIpQLSc6C1su3FLwG1ESO4PfhWLjnOUe8dngO7Ddvx3Md9s2X55M5w/viewform

Essayez d'aller le plus loin possible.

## Exercice 1

Lire le cours `05-js-types-and-variables` jusqu'a la fin du chapitre `Boolean type`.  
Pratiquer les exemples.

## boolean.js

Ecrire un script `boolean.js` qui affichera le résultat des expressions suivantes qui ont été assignées à des variables.  
Evaluer d'abord mentalement le résultat puis vérifier cela avec votre script.

```js
let res1 = (true && false) || (false && true)
let res2 = 10 > 11 && 11 > 10
let res3 = (true || false) && true
let res4 = (!true && !false) || (!false && !false)
let res5 = 'Hello' === 'Hello' && 'World' == 'Word'
let res6 = (!(20 >= 20) && 7 === 7) || true
let res7 = '1' === 1 && '2' == 2 && '3' === 3
let res8 = !res7
let res9 = !res8
let res10 =
  (res1 && res2) || (res3 && res4) || (res5 && res6) || (res7 && res8 && res9)
```

Vous devrez afficher les résultats sur la console avec un `console.log`, par exemple:

```js
console.log(`res1 = ${res1}`)
```

Dans le doute sur la priorité des différents opérateurs vous pouvez vous appuyer sur cette [table](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Operator_Precedence#table).  
Plus le chiffre de la 1ere colonne est élevé plus l'opérateur est prioritaire sur ceux d'en dessous.

## trading.js

Ecrivez un programme qui décidera si vous devez vendre, acheter du Bitcoin ou ne rien faire en fonction d'un prix.

## coat.js

Améliorer l'exemple du cours:

```js
// Programme qui va m'aider à décider si je dois mettre mon manteau
// ou pas en fonction d'une méteo pluvieuse ou venteuse
let isRainy = true
let isWindy = false

if (isRainy || isWindy) {
  console.log('Mettez votre manteau')
} else {
  console.log('Nous n avez pas besoin de manteau today')
}
```

Vous devrez aussi prendre en compte la température pour décider si on doit mettre un manteau ou pas.

## xor.md

Créer un fichier `markdown` `xor.md` ou vous écrirez la table de vérité de l'opération `xor`.  
Expliquez comment fonctionne cet opération `xor`.  
_Bien que l'on peut utiliser `xor` pour des opérations bit à bit avec `^` il n'existe pas d'opérateur logique pour `xor` équivalent à `&&` et `||`._  
Pour faire une table en `markdown`, vérifier dans les sources du cours: https://raw.githubusercontent.com/AbsoluteVirtueXI/blockchain-courses/master/programming/05-js-types-and-variables.md

## xor.js

En vous basant sur vos explications de l'exercice précédent, ou d'internet, écrivez un programme qui simule une opération `xor`.  
_indice: `xor` peut être obtenu avec une combinaison d'opérateurs logiques `&&`, `||` et `!`._
La réponse peut être obtenue sur internet, essayez de comprendre!!!

## wardrobe.js

Ecrivez un programme qui affichera un message contenant tous les vêtements et accessoires que vous devrez porter en fonction des données méteo.
Ci dessus le début d'un template:

```js
let isRainy = true
let temperature = 10
let clothes = ''

if (isRainy) {
  clothes += 'umbrella, ' // concatenation de string
}

if (temperature < 15) {
  clothes += 'coat, '
} else if (temperature >= 15 && temperature <= 20) {
  clothes += 'sweater, '
} else {
  clothes += 't-shirt, '
}
console.log(`Je vous recommande de porter: ${clothes}`)
```

Soyez imaginatif et cohérent.
Si l'on veut bien faire, cet exercice peut être assez difficile, par exemple un t-shirt doit être toujours porté, même sous un pull ou un manteau.
