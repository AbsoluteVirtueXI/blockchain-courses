# Exercices async partie 2

Vous devez mettre tous les exercices dans 1 unique repository qui est accessible depuis github.  
Créez un nouveau repo sur github et utilisez l'utilitaire `djinit` pour créer le repo en local sur votre machine: [instruction](https://github.com/AbsoluteVirtueXI/alyra-courses/blob/master/node/1-node-introduction.md#djinit)  
**LE PROJET CONTENANT VOS EXERCICES DOIT OBLIGATOIREMENT ETRE CREE AVEC L UTILITAIRE DJINIT**

Créez 1 fichier par exercice (ex01.js, ex02.js, ..etc) que vous enregistrerez sous le repertoire `src/` de votre repository.

## 1 lire le cours et pratiquer:

Lisez le cours _exercices-async-1.md_ et _exercices-async-2.md_, pratiquez les exemples et essayez de jouer avec eux afin de découvrir de nouvelles possibilités. Utilisez la fonction `asyncTask` du cours _exercices-async-2.md_ pour comprendre les différents concepts exposés

## 2 **faster.js**:

Ecrivez un programme qui determine lequel de ces 4 sites répond le plus rapidement aux rêquetes http

- https://www.facebook.com
- https://www.amazon.com
- https://www.apple.com
- https://www.google.com

## 3 **downloadAndCopy.js**:

Ecrivez un programme qui télécharge une page d'un site internet puis la copie dans un fichier.
L'url du site ainsi que le nom du ficher où sera copié la page téléchargée devront être passés en arguments de la ligne de commande.

## 4 **showDirFiles.js**:

Ecrire un programme qui affiche le contenu de tous les fichiers d'un repertoire. Le repertoire devra être passé en argument de la ligne de commande.
Parcourir la documentation de l'api `fs` de node.js afin de decouvrir une fonction asynchrone qui puisse vous lister tous les fichiers contenus dans un repertoire.
