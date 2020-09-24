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
% node calculator.js - 10 1
9
% node calculator.js * 5 4
20
% node calculator.js / 10 2
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

## 9: **majorityTest.js**:

Un état vous demande d'ecrire un petit programme qui vérifit que les citoyens ont le droit de voter.  
Ecrivez un programme qui demande l'utilisateur son nom, son prenom, son age.  
Si l'âge est inférieur à 18 lui afficher avec le prenom et nom correspondant:

```zsh
Désolé, prenom nom, vous êtes mineur, vous ne pouvez pas voter
```

Si l'âge est supérieur ou égal à 18 lui afficher:

```zsh
prenom nom, vous êtes majeur, vous pouvez voter
```

## 10: **interMajorityTest.js**:

Le programme précedent ne fonctionnera que dans les pays ou la majorité est à 18 ans.  
Afin que votre programme puisse fonctionner pour tous les pays, réecrivez le programme précedent pour qu'il puisse prendre un argument à son lancement en ligne de commande qui correspondera à l'age de la majorité dans le pays de l'utilisateur du programme.  
Un utilisateur américain lancerait le programme avec la commande:

```zsh
% node interMajorityTest.js 21
```

Un utilisateur francais lancerait le programme avec la commande:

```zsh
% node interMajorityTest.js 18
```

Si l'âge est inférieur à l'argument passé en ligne de commande lui afficher avec le prenom et nom correspondant:

```zsh
Désolé, prenom nom, vous êtes mineur, vous ne pouvez pas voter
```

Si l'âge est supérieur ou égal à l'argument passé en ligne de commande lui afficher:

```zsh
prenom nom, vous êtes majeur, vous pouvez voter
```

## 11: **guessNumber.js**

Ecrivez un petit jeu qui demande à un utilisateur de trouver un nombre qui aura été passé en ligne de commande.
Le programme s'éxecutera tant que l'utilisateur n'aura pas trouvé le bon nombre.
Après chaque tentative de l'utilisateur pour trouver le nombre secret, celui entré en argument du programe à son lancement, les messages suivant lui appaitront:

- si le nombre entré par l'utilisateur est plus petit que le nombre secret:
  **'Nombre trop petit'** en rouge
- si le nombre entré par l'utilisateur est plus grand que le nombre secret:
  **'Nombre trop grand'** en rouge
- si le nombre entré par l'utilisateur est égal au nombre secret:
  **'Bravo!'** en vert

## 12: **quiz.js**

Ecrivez un qcm de 5 questions. Le joueur devra repondre aux questions en entrant le nombre correspondant à la bonne réponse.
A la fin du qcm vous lui donnerez sa note qui correspondera au nombre de bonnes reponses sur les 5 questions.
Je vous propose les 5 questions et les choix possibles, mais vous pouvez créer les votre si vous voulez:

- Question 1: Le C++ est un:  
   1: langage => réponse attendue  
   2: compilateur

- Question 2: TypeScript est une évolution de Javascript:  
   1: Vrai => réponse attendue  
   2: Faux

- Question 3: Lire les cours avant de faire les éxercices est inutile:  
   1: Vrai  
   2: Faux => réponse attendue

- Question 4: react.js a été developpé par Google:  
   1: Vrai  
   2: Faux => réponse attendue

- Question 5: Ethereum est une blockchain publique:  
   1: Vrai => réponse attendue  
   2: Faux
