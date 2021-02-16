# Exercices types and boolean

Ces exercices devront tous être pushés sur un repository accessible depuis github.  
Ce repository devra se nommer `exo-numbers-strings`
Vous devrez fournir ce lien dans le formulaire de rendus d'exercices suivant: https://docs.google.com/forms/d/e/1FAIpQLSc6C1su3FLwG1ESO4PfhWLjnOUe8dngO7Ddvx3Md9s2X55M5w/viewform

Essayez d'aller le plus loin possible.  
Les exercices qui nécessitent une réflexion approfondie sont sous la section: **Challenge**

# Exercice 1

Vérifier les conditions de vos exercices précédents: https://github.com/AbsoluteVirtueXI/blockchain-courses/blob/master/exercices/programming/exercices-types-and-boolean.md  
Testez bien chaque conditions en changeant vos variables et vérifier que vous obtenez bien le résultat attendu.

# decimal.js

Ecrivez un programme qui affiche sur la console, les nombres suivants en base 10 (c'est à dire en décimal)

```js
0x123
0123
0b10011001
0xdeadbeef
0xea7beef
0b1111111111111111
0777
```

# convert.js

Ecrivez un programme qui convertira les nombres suivants en binaire, octal et hexadécimal (utiliser `.toString()` pour cela):

```txt
10
15
16
5005
52390903
```

## nbChar.js

Ecrivez un programme qui affiche le nombre de caractères que possède le texte suivant:

```txt
Je suis le ténébreux, - le veuf, - l'inconsolé,
Le prince d'Aquitaine à la tour abolie :
Ma seule étoile est morte, - et mon luth constellé
Porte le soleil noir de la Mélancolie.

Dans la nuit du tombeau, toi qui m'as consolé,
Rends-moi le Pausilippe et la mer d'Italie,
La fleur qui plaisait tant à mon cœur désolé,
Et la treille où le pampre à la rose s'allie.

Suis-je Amour ou Phébus ? ... Lusignan ou Biron ?
Mon front est rouge encor du baiser de la reine ;
J'ai rêvé dans la grotte où nage la sirène...

Et j'ai deux fois vainqueur traversé l'Achéron ;
Modulant tour à tour sur la lyre d'Orphée
Les soupirs de la sainte et les cris de la fée.
```

# showChar.js

Ecrivez un programme qui affiche ligne par ligne, l'index et le caractère situé à cet index de la phrase suivante:

```txt
C'était à Mégara, faubourg de Carthage, dans les jardins d'Hamilcar.
```

Le format du message attendu pour chaque caractère sera par exemple:  
`Le caractère C est à l'index 0`
`Le caractère ' est à l'index 1`

## showChar.js

Améliorez l'exercice précédent pour écrire un message introductif avant l'exécution du programme.  
Ce message devra afficher l'auteur et le livre dont est extrait cette phrase, ainsi que le nombre de caractères que contient cette phrase.

# Challenge

## countE.js

Ecrivez un programme qui compte le nombre de `e` dans le texte de l'exercice `nbChar.js`

## countFullE.js

Le programme précédent ne compte pas les `E` majuscules.
Pouvez vous trouver un moyen pour que l'on compte le nombre de `e` total peu importe la casse.
Vous devrez utiliser la méthode `.toUpperCase()` ou `.toLowerCase()` pour cela.

## countVowel.js

Même exercice que précédemment mais vous compterez toutes les voyelles.
