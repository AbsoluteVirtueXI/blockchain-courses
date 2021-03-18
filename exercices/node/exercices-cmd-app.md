# Exercices command line applications

Ces exercices devront tous être pushés sur un repository accessible depuis github.  
Ce repository devra se nommer `exo-cmd-app`.  
Suivez les instructions des cours précédents pour initialiser votre répertoire de travail en package Node.js avec `yarn init`.  
Vous devrez fournir le lien de votre repo github dans le formulaire de rendus d'exercices suivant: https://forms.gle/hodtGoSpJuqireE89
Essayez d'aller le plus loin possible.  
Certains exercices nécessitent une réflexion approfondie prenez votre temps pour anticiper les différentes étapes que devra traiter votre programme.

Les programmes que vous devez créer utilisent une interaction avec la ligne de commande.  
Il faut absolument vérifier que les inputs envoyés à votre programme sont corrects et que votre programme ne se retrouve jamais dans un état indéfini, **tout doit être sous contrôle et un message clair doit être affiché à l'utilisateur en cas de mauvaise manipulation de la ligne de commande.**

## **_sayMyName.js_**

Ecrivez un script `sayMyName.js` qui prend en argument de la ligne de commande une `string` et affiche un message comme ci-dessous:

```zsh
% node sayMyName.js Sofiane
My name is Sofiane.
```

## pyramid.js

En vous basant sur l'exemple du cours `showStars.js`, écrire un programme `pyramid.js` qui prend 2 arguments sur la ligne de commande:

- le nombre d'éléments qui sera la base de la pyramide
- une string (un caractère) qui sera le motif à afficher contrairement à l'exemple du cours qui affiche par défaut le caractère `*`.

## **majorityTest.js**:

Un état vous demande d'écrire un petit programme qui vérifie que les citoyens ont le droit de voter.  
Ecrivez un programme qui demande l'utilisateur son nom, son prenom, son age.  
Si l'âge est inférieur à 18 lui afficher avec le prénom et nom correspondant:

```zsh
Désolé, prenom nom, vous êtes mineur, vous ne pouvez pas voter
```

Si l'âge est supérieur ou égal à 18 lui afficher:

```zsh
prenom nom, vous êtes majeur, vous pouvez voter
```

Utiliser `readline-sync` pour l'interaction avec l'utilisateur

## 10: **interMajorityTest.js**:

Le programme précédent ne fonctionnera que dans les pays ou la majorité est à 18 ans.  
Afin que votre programme puisse fonctionner pour tous les pays, réécrivez le programme précédent pour qu'il puisse prendre un argument à son lancement en ligne de commande qui correspondra à l'âge de la majorité dans le pays de l'utilisateur du programme.  
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

Utiliser `readline-sync` pour l'interaction avec l'utilisateur.

## pyramid.js

Améliorer le programme `pyramid.js` précédent en ajoutant un paramètre optionnel sur la ligne de commande qui devra arriver à la fin de la ligne de la commande: `-r`.
Si ce paramètre est présent la pyramide devra être affichée à l'envers.

```zsh
node pyramid.js 5 A -r
AAAAA
AAAA
AAA
AA
A
```

## **guessNumber.js**

Ecrivez un petit jeu qui demande à un utilisateur de trouver un nombre qui aura été passé en ligne de commande par le maitre du jeu.
Le programme s'exécutera tant que l'utilisateur n'aura pas trouvé le bon nombre.
Après chaque tentative de l'utilisateur pour trouver le nombre secret, celui entré en argument de la ligne de commande du programme à son lancement, les messages suivant lui apparaîtront:

- si le nombre entré par l'utilisateur est plus petit que le nombre secret:
  **'Nombre trop petit'** en rouge
- si le nombre entré par l'utilisateur est plus grand que le nombre secret:
  **'Nombre trop grand'** en rouge
- si le nombre entré par l'utilisateur est égal au nombre secret:
  **'Bravo!'** en vert

Utiliser `readline-sync` pour l'interaction avec l'utilisateur.

## **quiz.js**

Ecrivez un qcm de 5 questions. Le joueur devra répondre aux questions en entrant le nombre correspondant à la bonne réponse.
A la fin du qcm vous lui donnerez sa note qui correspondra au nombre de bonnes réponses sur les 5 questions.
Je vous propose les 5 questions et les choix possibles, mais vous pouvez créer les votre si vous voulez:

- Question 1: Le C++ est un:  
   1: langage => réponse attendue  
   2: compilateur

- Question 2: TypeScript est une évolution de Javascript:  
   1: Vrai => réponse attendue  
   2: Faux

- Question 3: Lire les cours avant de faire les exercices est inutile:  
   1: Vrai  
   2: Faux => réponse attendue

- Question 4: react.js a été developpé par Google:  
   1: Vrai  
   2: Faux => réponse attendue

- Question 5: Ethereum est une blockchain publique:  
   1: Vrai => réponse attendue  
   2: Faux

Utiliser `readline-sync` pour l'interaction avec l'utilisateur.
