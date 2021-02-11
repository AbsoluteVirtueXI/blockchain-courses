# Exercices intro Javascript

## Prérequis

Créer un répertoire `Alyra` qui contiendra tous vos futurs projets de la formation.  
Dans ce répertoire `Alyra` créer un répertoire `exo-intro`.  
Ce répertoire `exo-intro` contiendra tous les exercices à rendre.
Demain lorsque nous découvrirons `git` et `github` vous pusherez le contenu de ce repertoire `exo-intro`.

## Linux

### commandes

1. Créer un fichier texte _cmd.txt_ qui contient toutes les commandes bash/linux utiles que vous avez apprises depuis le début de cette formation
   Pour chacune de ces commandes trouver des options utiles qui peuvent changer le comportement ou l'output de ces commandes. Par exemple la commande `ls` liste le contenu du répertoire courant mais `ls -filah` donne un affichage plus détaillé.
2. La commande `sudo` est spéciale, expliquer à quoi elle sert, et dans quelle mesure vous pourrez en avoir besoin dans l'avenir. Ajouter vos explications dans le fichier _cmd.txt_.

## Javascript

### prez.js

Créer un fichier _prez.js_
L'exécution de ce script devra afficher un message:

```zsh
Hello, my name is Sofiane and i am 39 years old. I live in Paris.
```

Evidement les éléments `Sofiane`, `39` et `Paris` du message devront être paramétrables/variables en fonction de variables.

### pyramid1.js

Créer un fichier _pyramid1.js_.  
En vous servant de `console.log` successifs, l'exécution de ce script affichera:

```zsh
*
**
***
****
*****
******
*******
********
```

### pyramid2.js

Créer un fichier _pyramid2.js_.
En vous servant de `console.log` successifs, l'exécution de ce script affichera:

```zsh
*              *
**            **
***          ***
****        ****
*****      *****
******    ******
*******  *******
****************
```

### pyramid_generic.js

L'affichage de nos pyramides utilise le caractères `*`.  
_info_: En javascript un unique caractère est aussi une `string`.  
Trouver un moyen pour qu'en ne modifiant qu'une seule variable dans le script on puisse utiliser le caractère que l'on souhaite pour l'affichage.  
Implémenter cela dans un fichier _pyramid_generic.js_  
_indice_: ce caractère doit être dans une variable.  
On pourra obtenir avec une seule modification du fichier un affichage tel que:

```zsh
A              A
AA            AA
AAA          AAA
AAAA        AAAA
AAAAA      AAAAA
AAAAAA    AAAAAA
AAAAAAA  AAAAAAA
AAAAAAAAAAAAAAAA
```

ou bien:

```zsh
V              V
VV            VV
VVV          VVV
VVVV        VVVV
VVVVV      VVVVV
VVVVVV    VVVVVV
VVVVVVV  VVVVVVV
VVVVVVVVVVVVVVVV
```

### convert.js

Le script suivant _convert.js_ n'affiche pas le résultat attendu:

```js
let nb1 = 10
let nb2 = '7'
let sum = nb1 + nb2
console.log(sum)
```

Nous attendons comme résultat `17`.  
Après avoir effectué vos recherches corrigez le script pour qu'il affiche le résultat attendu.

### manual_count.js

Créer un script _manual_count.js_  
En ne vous servant que de `console.log` écrivez un programme qui affiche les nombres de 0 à 20.  
L'affichage à l'exécution du script devra ressembler à ca:

```zsh
0
1
2
3
4
....
18
19
20
```

### for_count.js

En allant plus loin dans le cours vu ce matin, créer un fichier _for_count.js_ qui affiche les nombres de 0 à 1000.  
Vous devrez utiliser une boucle `for` pour cela.  
Implémenter votre solution dans un fichier _for_count.js_

### reverse_for_count.js

Même principe que l'exercice précédent, mais cette fois de 1000 à 0.
