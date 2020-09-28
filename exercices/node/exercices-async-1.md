# Exercices async partie 1

Vous devez mettre tous les exercices dans 1 unique repository qui est accessible depuis github.  
Créez un nouveau repo sur github et utilisez l'utilitaire `djinit` pour créer le repo en local sur votre machine: [instruction](https://github.com/AbsoluteVirtueXI/alyra-courses/blob/master/node/1-node-introduction.md#djinit)  
**LE PROJET CONTENANT VOS EXERCICES DOIT OBLIGATOIREMENT ETRE CREE AVEC L UTILITAIRE DJINIT**

Créez 1 fichier par exercice (ex01.js, ex02.js, ..etc) que vous enregistrerez sous le repertoire `src/` de votre repository.

Pour les exercices suivant nous manipulerons le système de fichiers.
Il vous sera nécessaire de créer à la racine de votre projet un fichier _file1.txt_ qui contiendra le texte suivant:

_file1.txt_:

```txt
“If you think your users are idiots, only idiots will use it.”
— Linus Torvalds

“Computers are good at following instructions, but not at reading your mind.”
— Donald Knuth

“There is only one problem with common sense; it’s not very common.”
— Milt Bryce
```

## 1: **syncCopy.js**

Ecrivez un programme qui copie le fichier **file1.txt** vers le fichier **file2.txt** en utilisant les api synchrones du module `fs` de node.js

## 2: **callbackCopy.js**

Ecrivez un programme qui copie le fichier **file1.txt** vers le fichier **file2.txt** en utilisant les api asynchrones basées sur des callbacks du module `fs` de node.js.

## 3: **promiseCopy.js**

Ecrivez un programme qui copie le fichier **file1.txt** vers le fichier **file2.txt** en utilisant les api asynchrones basées sur des **promises** du module `fs` de node.js.

## 4: **Optionnel**:

Réecrivez le programme **promiseCopy.js** afin qu'il puisse accepter 2 arguments de la ligne de commande:

- un fichier **source**, qui est le fichier à copier
- un fichier **dest**, qui sera la destination de la copie

Comme pour l'exercice précedent utiliser les api asynchrones basées sur des **promises** du module `fs` de node.js.
