# Exercices database partie 1

Le rendu de ces exercices se fera dans un repository accessible depuis github qui contiendra un unique fichier _README.md_.
Ce fichier contiendra toutes les commandes et les outputs de ces commandes classées par exercices, comme demandé dans les énoncés.

# 1

Créer une base de donnée "db_1" qui contient une table "users" qui correspond à la database que nous avons créé dans le cour précédent sur express:

```js
const db_user = {
  alice: '123',
  bob: '456',
  charlie: '789',
}
```

Créez les bons champs et donner les bons types à chaque champs. N'oubliez pas un champ "id" qui correspondra à la clé primaire.  
Ensuite afficher toutes les lignes de la table "users" de la base de donnée "db_1".
Vous devrez fournir les commandes SQL entrées ainsi que tous les outputs de ces commandes.

# 2

Ajouter 3 utilisateurs 'dan', 'eve', 'faythe' qui auront respectivement les password '101112', '131415', '161718'.  
Affichez toutes les lignes de la table "users" de la base de donnée "db_1".  
Vous devrez fournir les commandes SQL entrées ainsi que tous les outputs de ces commandes.

# 3

Affichez toutes les lignes de la table "users" de la base de donnée "db_1" dont le password possède plus de 3 caractères. Pour cela il vous faudra utiliser la fonction `LENGTH`.  
Vous devrez fournir les commandes SQL entrées ainsi que tous les outputs de ces commandes.

# 4

Modifiez la table "users" afin d'ajouter une nouvelle colonne "bio" qui contiendra une description a propos de l'utilisateur. Ce champ "bio" sera du texte avec un nombre de caractères illimités et sa valeur par défaut sera "Hello, world!"
Vous devrez fournir les commandes SQL entrées ainsi que tous les outputs de ces commandes.

# 5

Modifiez toutes les lignes existantes pour que la "bio" de chacun affiche, "Hello, i am PRENOM_DU_USER".  
Il faudra remplacer `PRENOM_DU_USER` par le véritable login de l'utilisateur.  
Vous devrez fournir les commandes SQL entrées ainsi que tous les outputs de ces commandes.

# 6

Afficher les 2 lignes qui ont les "id" les plus grands par ordre décroissant.
Vous devrez fournir les commandes SQL entrées ainsi que tous les outputs de ces commandes.

# 7

Afficher toutes les lignes de la table "users" dont les "id" sont impairs par ordre croissant.
Vous devrez fournir les commandes SQL entrées ainsi que tous les outputs de ces commandes.

# 8

Effacez toutes les lignes de la table "users dont les "id" sont pairs.
Affichez toutes les lignes de la table users.
Vous devrez fournir les commandes SQL entrées ainsi que tous les outputs de ces commandes.

# 9

Effacer la TABLE "user".  
Effacer la DATABASE "db_1".  
Vous devrez fournir les commandes SQL entrées ainsi que tous les outputs de ces commandes.
