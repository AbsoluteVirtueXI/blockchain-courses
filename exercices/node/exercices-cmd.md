# Exercices command line

Vous devez mettre tous les exercices dans 1 unique repository qui est accessible depuis github.  
Créez un nouveau repo sur github et utilisez l'utilitaire `djinit` pour créer le repo en local sur votre machine: [instruction](https://github.com/AbsoluteVirtueXI/alyra-courses/blob/master/node/1-node-introduction.md#djinit)  
**LE PROJET CONTENANT VOS EXERCICES DOIT OBLIGATOIREMENT ETRE CREE AVEC L UTILITAIRE DJINIT**

Créez 1 fichier par exercice (ex01.js, ex02.js, ..etc) que vous enregistrerez sous le repertoire `src/` de votre repository.

Les programmes que vous devez créer utilisent une interaction avec la ligne de commande.  
Il faut absolument vérifier que les inputs envoyés à votre programme sont corrects et que votre programme ne se retrouve jamais dans un état indéfini, **tout doit être sous contrôle et un message clair doit être affiché à l'utilisateur en cas de mauvaise manipulation de la ligne de commande.**

## 1: **_sayGoodbye.js_**

Ecrivez un script _sayGoodbye.js_ qui prend en argument de la ligne de commande une `string` et affiche un message comme ci-dessous:

```zsh
% node sayGoodbye.js React
Goodbye, React
```

## 2: **_showArgs.js_**

Ecrivez un script _showArgs.js_ qui prend en arguments de la ligne de commande plusieures `string` et les affiche dans l'ordre inverse de leur ordre d'entrée:

```zsh
% node showArgs.js 1 2 3 Soleil
Soleil
3
2
1
```

## 3: **_counter.js_**

Ecrivez une programme `counter` qui prend 3 arguments en ligne de commande:

- un nombre `min` pour le début du counter
- un nombre `max` pour la fin du counter
- un nombre `step` pour le pas/interval du counter

L'execution de ce programme devra afficher sur le terminal tous les nombres de `min` jusqu'a `max` avec un interval de `step`:

```zsh
% node counter.js 1 10 2
1
3
5
7
9
% node counter.js 100 1000 100
100
200
300
400
500
600
700
800
900
1000
```

## 4: **_showInvStars.js_**

Ecrivez un script _showInvStars.js_ qui prend en argument de la ligne de commande un nombre et affiche sur le terminal une pyramide comme ci-dessous:

```zsh
% node showInvStars.js 3
***
**
*
% node showInvStars.js 10
**********
*********
********
*******
******
*****
****
***
**
*
```

## 5: **_calculator.js_**:

Ecrivez un script _calculator.js_ qui effectue en ligne de commane des opérations arithmétiques simples:

```zsh
% node calculator.js + 10 21
31
node calculator.js - 10 1
9
node calculator.js * 5 4
20
node calculator.js / 10 2
5
```

## 6: **_palindromeChecker.js_**

Ecrivez un script _palindromeChecker.js_ qui verifit si l'argument passé en ligne de commande est un palindrome:

```zsh
% node palindromeChecker.js tenet
tenet is a palindrome
% node palindromeChecker.js 3133773313
3133773313 is a palindrome
% node palindromeChecker.js Alyra
Alyra is not a palindrome
```

## 7: **_oddTest.js_**

Ecrivez un script _oddTest.js_ qui vérifit si l'argument passé en ligne de commande est impair:

```zsh
% node oddTest.js 7
7 est un nombre impair
% node oddTest.js 10
10 est un nombre pair
```

## 8: **_absolutePath.js_**

Ecrivez un script qui retourne le chemin absolu de votre script sur votre système de fichier.
**Indice**: c'est une information est qui disponible dans le tableau `process.argv`

```zsh
% node absolutePath.js
/Users/akersof/vsproject/js-training/src/absolutePath.js
```
