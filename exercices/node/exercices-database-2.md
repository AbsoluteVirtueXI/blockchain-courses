# Exercices database partie 2

## 1

Télécharger la base de donnée: https://www.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip
Dézipper le fichier _dvdrental.zip_ et installer la base de donnée _dvdrental.tar_ avec les commandes suivantes:

```zsh
createdb -U db_user dvdrental
pg_restore -d dvdrental -U db_user --clean --create dvdrental.tar
```

Il se peut que vous ayez des warnings ou des erreurs, mais c'est pas grave.

Vous pouvez ensuite vous connecter à la bade de donnée dvdrental:

```zsh
% psql -d dvdrental -U db_user
```

Vous êtes maintenant connectés à la base de donnée `dvdrental`

Vous pouvez récupérer un modele visuel de cette base de donnée sur:
https://www.postgresqltutorial.com/postgresql-sample-database/  
C'est très utile si vous voulez comprendre que représente cette base de données.

la commande `\dt` vous donne la liste des tables.  
la commande `\d NOM_DE_LA_TABLE` vous affiche le nom des colonnes ainsi que les types associés à chaque colonnes.

## 2

Ecrivez une requête SQL qui affiche tous les titres et descriptions des films dont la description contient le mot `Amazing`.

## 3

Ecrivez une requête SQL qui récupère tous les paiements supérieurs à 10.
Il faudra récupérer l'id, le prénom, le nom du client ainsi que le montant et la date du paiement.

```txt
customer_id | first_name |  last_name   | amount |        payment_date
```

## 3

Ecrivez une requête SQL qui affiche le chiffre d'affaire gagné par le video club depuis son ouverture.

## 4

Ecrivez une requête SQL qui affiche le titre de tous les films dont la langue est l'anglais et dont la durée est supérieure à 120 minutes.

## 5

Ecrivez une requête SQL qui affiche le TOP 10 des clients qui ont fait le plus d'achat dans ce video club.
Il faudra récupérer leur id, prénom, nom, email.
Il vous faudra utiliser les requêtes auxiliaires avec `WITH` pour cette exercice.

## 6

Récupérer les mêmes informations que l'exercice précédent, mais ajouter avec un `JOIN` le montant total des achats pour chacun du TOP 10 des clients.

## 7

Faîtes preuves d'imagination et essayez de créer une requête très complexes que vous expliquerez. Cette requête devra utiliser les concepts que nous avons étudié en cours et vu dans les exercices précédents.
