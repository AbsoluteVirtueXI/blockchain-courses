# Exercices express partie 2

Vous devez mettre tous les exercices dans 1 unique repository qui est accessible depuis github.  
Créez un nouveau repo sur github et utilisez l'utilitaire `djinit` pour créer le repo en local sur votre machine: [instruction](https://github.com/AbsoluteVirtueXI/alyra-courses/blob/master/node/1-node-introduction.md#djinit)  
**LE PROJET CONTENANT VOS EXERCICES DOIT OBLIGATOIREMENT ETRE CREE AVEC L UTILITAIRE DJINIT**

Les exercices qui suivent sont une amélioration de l'exercice 1 (a moins que ce soit notifié dans l'exercice qu'il faille créer un nouveau fichier).
Vous devrez à chaque fois améliorer l'exercice précedent et lui ajouter les fonctionalités demandées dans l'exercice

## 1

Créer un projet qui accueillera l'exemple du cours first-rest-api.
Il devra fonctionner comme convenu dans le cours.
Respectez l'architecture des dossiers.
Exécuter le serveur avec `node src/api-server.js`

## 2

Avec un client REST, remplir la base de donnée de users depuis la route `/register`.  
Respecter le format JSON attendu par cette route. Lire le code si nécéssaire.

## 3

Avec un client REST, utiliser/tester les différentes routes accessibles avec une méthode `GET`.  
Il vous faudra renseigner dans les headers de votre client REST, le champ `Authorization` et lui associé une api key valide.

## 4

Créer une route `/blacklist` qui invalidera un utilisateur en mettant le champ `active` de la table `users` à `false` pour un id passé en paramètre.
**Seul le user avec l'id 1 pourra faire appelle à cette fonction**
Mettez en place ce système de contrôle afin que d'autres utilisateurs ne puisse faire appelle à cette fonction.

## 5

Créer une route `/whitelist` qui invalidera un utilisateur en mettant le champ `active` de la table `users` à `true` pour un id passé en paramètre.
**Seul le user avec l'id 1 pourra faire appelle à cette fonction**
Mettez en place ce système de contrôle afin que d'autres utilisateurs ne puisse faire appelle à cette fonction.
