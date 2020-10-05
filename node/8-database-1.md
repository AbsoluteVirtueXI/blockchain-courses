# **Database 1ere partie**

Actuellement il existe 2 catégories de base données, les bases de données SQL et les bases de données NO-SQL.  
Nous utiliserons la base de données PostgreSQL, que l'on appelle communément Postgres.
Site officiel: https://www.postgresql.org/  
Documentation officielle: https://www.postgresql.org/docs/

## Installation et configuration de sécurité

Documentation officielle pour l'installation: https://www.postgresql.org/download/

### Macosx:

```zsh
% brew install postgresql
% brew services start postgresql
% psql postgres
```

Au prompt postgresql entrez la commande suivante et créer un password pour le superuser:

```sql
postgres=# \password
```

Quittez le prompt postgresql:

```sql
postgres=# \quit
```

Dans le fichier _/usr/local/var/postgres/pg_hba.conf_ remplacer toutes les méthodes d'authentification `TRUST`/`PEER` par des `md5`:

```conf
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     md5
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
# IPv6 local connections:
host    all             all             ::1/128                 md5
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     md5
host    replication     all             127.0.0.1/32            md5
host    replication     all             ::1/128                 md5
```

redémarrez le service postgresql

```zsh
% brew services restart postgresql
```

Vous pouvez maintenant vous connecter au serveur postgresql avec la commande suivante:

```zsh
% psql -d postgres -U mon_login_mac
```

### Linux:

```zsh
% sudo apt-get remove postgresql
% sudo apt-get remove postgresql-11
% wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
% echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
% sudo apt-get update
% sudo apt-get -y install postgresql-12 postgresql-client-12
% sudo service postgresql start
% sudo su - postgres
% psql
```

Au prompt postgresql entrez la commande suivante et créer un password pour le user postgres:

```sql
postgres=# \password
```

pour quitter le prompt postgresql

```sql
postgres=# \quit
```

Si vous êtes actuellement avec le user `postgres` vous devez revenir à votre shell user en entrant la commande `exit`:

```zsh
postgres% exit
```

Dans le fichier _/etc/postgresql/12/main/pg_hba.conf_ remplacer toutes les méthodes d'authentification `TRUST`/`PEER` par des `md5`:

```conf
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     md5
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
# IPv6 local connections:
host    all             all             ::1/128                 md5
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     md5
host    replication     all             127.0.0.1/32            md5
host    replication     all             ::1/128                 md5
```

ensuite redémarrer le service postgresql:

```zsh
sudo service postgresql restart
```

Vous pouvez maintenant vous connecter au serveur postgresql avec la commande suivante:

```zsh
% psql -d postgres -U postgres
```

### Create a postgresql user

```sql
postgres=# CREATE ROLE db_user WITH LOGIN PASSWORD 'strongpassword123';
postgres=# ALTER ROLE db_user CREATEDB;
```

Pour lister tous les users postgresql:

```sql
postgres=# \du
```

Quittez le prompt postgresql avec la commande `\q` et connectez vous avec le user `db_user`:

```zsh
% psql -d postgres -U db_user
postgres=>
```

## Commandes utiles sur le prompt postgresql:

- \conninfo | Affiche les informations de connections
- \q | Exit psql connection
- \c | Connect to a new database
- \dt | List all tables
- \du | List all roles
- \list | List databases

## Create a database

```sql
postgres=> CREATE DATABASE first_db;
```

En listant toutes les bases de données avec la commande `\list` on retrouve bien notre base de données.

On peut se connecter directement à notre base de données avec la commande connect `\c`

```sql
postgres=> \c first_db;
You are now connected to database "first_db" as user "db_user".
first_db=>
```

Depuis une invite de commande `bash` on se connectera directement à cette base de données avec `psql`:

```zsh
% psql -d first_db -U db_user
```

## CREATE Tables

Créez une table "users" avec 3 champs, une `PRIMARY KEY`de type `serial` que l'on nommera "id", 2 `VARCHAR` de 30 caractères maximum que l'on nommera "name" et "email":

```sql
first_db=> CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(30), email VARCHAR(30));
```

## INSERT data into tables

Ajouter 2 lignes à la table "users":

```sql
first_db=> INSERT INTO users (name, email) VALUES ('alice', 'alice@mail.com'), ('bob', 'bob@mail.com');
```

## SELECT: Query the database

Récupérer toutes les lignes de la table "users":

```sql
first_db=> SELECT * FROM users;
 id | name  |     email
----+-------+----------------
  1 | alice | alice@mail.com
  2 | bob   | bob@mail.com
(2 rows)
```

Récupérer les champs "id" et "name" de toutes les lignes la table "users":

```sql
first_db=> SELECT id, name FROM users;
 id | name
----+-------
  1 | alice
  2 | bob
(2 rows)
```

## WHERE clause

Appliquer une requête qu'à certaines lignes en fonction de la condition de la clause `WHERE`:

```sql
first_db=> SELECT id FROM users WHERE name = 'alice';
 id
----
  1
(1 row)
```

## ALTER: Modifying tables

Ajoutons une colonne "age" à notre table "user".
la colonne "age" contiendra des `SMALLINT`, les valeurs devront être `>= 0` et la valeur par défaut sera `0`

```sql
first_db=> ALTER TABLE users ADD COLUMN age SMALLINT CHECK (age >= 0) DEFAULT 0;
```

## UPDATE row values:

```sql
first_db=> UPDATE users SET age = 20, email = 'alice@coldmail.com' WHERE name = 'alice';
```

```sql
first_db=> UPDATE users SET age = 30  WHERE name = 'bob';
```

## DELETE rows:

Insérons d'abord quelques lignes:

```sql
first_db=> INSERT INTO users (name, email, age) VALUES ('universe', 'universe@mail.com', 42), ('charlie', 'charlie@mail.com', 30);
```

Supprimons toutes les lignes qui contiennent une valeur "age" inférieure à 25 ou supérieure à 35:

```sql
first_db=> DELETE FROM users WHERE age < 25 OR  age > 35;
```

## datatypes:

Documentation officielle: https://www.postgresql.org/docs/12/datatype.html

## contraints:

Documentation officielle: https://www.postgresql.org/docs/12/ddl-constraints.html

## DROP tables and databases:

Effacer une table:

```sql
first_db=> DROP TABLE users;
```

Effacer une database:

```sql
first_db=> \c postgres
You are now connected to database "postgres" as user "db_user".
postgres=> DROP DATABASE first_db;
```
