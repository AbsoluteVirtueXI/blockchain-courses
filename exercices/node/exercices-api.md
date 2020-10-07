# Exercices API

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

Avec un client REST, utilisez/testez les différentes routes accessibles avec une méthode `GET`.  
Il vous faudra renseigner dans les headers de votre client REST, le champ `Authorization` et lui associer une api key valide.

## 4

Créer une route `/blacklist` qui invalidera un utilisateur en mettant le champ `active` de la table `users` à `false` pour un id passé en paramètre.
**Seul le user avec l'id 1 pourra appeler cette fonction**
Mettez en place ce système de contrôle afin que d'autres utilisateurs ne puisse pas appeler cette fonction.
Le user avec l'id 1 est considéré comme l'administrateur de l'application

## 5

Créer une route `/whitelist` qui invalidera un utilisateur en mettant le champ `active` de la table `users` à `true` pour un id passé en paramètre.
**Seul le user avec l'id 1 pourra appeler cette fonction**
Mettez en place ce système de contrôle afin que d'autres utilisateurs ne puisse pas appeler cette fonction.
Le user avec l'id 1 est considéré comme l'administrateur de l'application.

## 6

Dans le middleware `validateApiKey` nous vérifions si l'api key de l'utilisateur existe, mais nous ne vérifions pas si le champ `active` est à `true` dans la table `user`.
Récrivez ce middleware afin que l'on vérifie si l'api key existe (c'est déjà le cas), mais aussi que le champ `active` est bien égal à `true`.
Si un utilisateur a été blacklisté, il ne faut surtout pas qu'il puisse accéder à notre api.

## 7

Créer un middleware `getUserByApiKey`, qui interviendra après `validateApiKey` qui attachera à objet `req` d'express l'objet `user`.
Cet objet `user` contiendra les informations du modèle `User`: `id`, `username`, `email`, `api_key`.  
C'est un middleware très pratique, ainsi nous pourrons avoir accès aux informations de l'utilisateur qui effectue la requête depuis `req.user`

## 8

Ajouter une route `/send` qui permettra d'envoyer un message depuis l'utilisateur appelant la fonction, vers un autre utilisateur.
Cette route sera accessible avec une méthode `POST` pour des utilisateurs avec une api key valide. Le JSON que nous récupérerons sera au format:

```json
{
  "dst": 2,
  "content": "Hello, how are you ?"
}
```

Si nous effectuons une requête POST vers `/send` avec le JSON précédent, nous enverrons le message `Hello, how are you ?` à l'utilisateur d'id 2.  
**Envoyer un message veut dire l'enregistrer dans la table `messages`.**  
L'id du sender peut être récupéré grâce à l'objet `req.user` créé dans l'exercice précédent.

## 9

Ajouter une route `/read` qui permettra à l'utilisateur qui effectue la requête de lire tous ses messages, du plus récent au plus ancien.
Les messages retournés seront aussi bien ceux envoyés que ceux reçus.
