# **Database 2eme partie**

## Working with more than 1 tables

Une base de données peut contenir plusieurs tables.

```sql
postgres=> CREATE DATABASE db_app;
postgres=> \c db_app;
db_app=> CREATE TABLE users (id SERIAL PRIMARY KEY, login VARCHAR(20) NOT NULL UNIQUE, password VARCHAR(20) NOT NULL, email TEXT NOT NULL UNIQUE, bio TEXT DEFAULT 'Hello, World', age SMALLINT CHECK (age >= 18) NOT NULL, created_at TIMESTAMP NOT NULL DEFAULT NOW());
db_app=> INSERT INTO users (login, password, email, bio, age) VALUES ('alice', '123', 'alice@mail.com', 'Hello, i am Alice', 18);
db_app=> INSERT INTO users (login, password, email, bio, age) VALUES ('charlie', '789', 'charlie@mail.com', 'Hello, i am Charlie', 22);
db_app=> INSERT INTO users (login, password, email, bio, age) VALUES ('dan', '101112', 'dan@mail.com', 'Hello, i am Dan', 44);
db_app=> INSERT INTO users (login, password, email, bio, age) VALUES ('eve', '131415', 'eve@mail.com', 'Hello, i am Eve', 34);
db_app=> INSERT INTO users (login, password, email, bio, age) VALUES ('fred', '161718', 'fred@mail.com', 'Hello, i am Fred', 29);
db_app=> INSERT INTO users (login, password, email, bio, age) VALUES ('gibs', '192021', 'gibs@mail.com', 'Hello, i am gibds', 55);
```

Créons une seconde table "products" qui référence la table "users":

```sql
db_app=> CREATE TABLE products (id SERIAL PRIMARY KEY, title VARCHAR(50) NOT NULL, description TEXT, price BIGINT DEFAULT 0, seller_id INTEGER NOT NULL REFERENCES users(id), buyer_id INTEGER REFERENCES users(id));
db_app=> INSERT INTO products (title, description, price, seller_id) VALUES ('Laptop', 'Bon etat', 20000, 5);
db_app=> INSERT INTO products (title, description, price, seller_id) VALUES ('TV', 'occaz', 10000, 5);
db_app=> INSERT INTO products (title, description, price, seller_id) VALUES ('Samsung', 'neuf', 15000, 1);
db_app=> INSERT INTO products (title, description, price, seller_id) VALUES ('Moto', 'seulement 5000km au compteur', 400000, 1);
db_app=> INSERT INTO products (title, description, price, seller_id) VALUES ('Headphones', 'copie ecouteurs apple', 500, 1);
db_app=> INSERT INTO products (title, description, price, seller_id) VALUES ('Maison', 'plein sud', 90000000, 3);
db_app=> INSERT INTO products (title, description, price, seller_id) VALUES ('Web app', 'Faite en react et node.js', 200000, 2);
```

Si nous souhaitons récupérer tous les produits que alice a mit en vente:

```sql
db_app=> SELECT * FROM products where seller_id = (SELECT id FROM users WHERE login = 'alice');
```

## JOIN

Si dans notre résultat nous avons besoin de récupérer des informations de plusieurs tables nous devons utiliser les jointures.
Par exemple nous souhaitons récupérer l'id, le login et l'email d'un user ainsi que le l'id le titre et le prix de ses objets mis en vente:

```sql
db_app=> SELECT users.id, users.login, users.email, products.id, products.title, products.price FROM users INNER JOIN products ON users.id = products.seller_id ORDER BY products.price;
```

La même chose mais uniquement pour le user qui a un "id" de 3:

```sql
db_app=> select users.id, users.login, users.email, products.id, products.title, products.price FROM users INNER JOIN products ON users.id = products.seller_id WHERE users.id = 3 ORDER BY products.price;
```

## Advanced SELECT

### DISTINCT pour supprimer les doublons:

```sql
SELECT DISTINCT seller_id from products;
```

### COUNT pour compter le nombres de lignes:

```sql
SELECT COUNT(*) from products WHERE seller_id = 1;
```

### WHERE pour filtrer le résultat d'une requête:

```sql
SELECT * FROM products WHERE seller_id = 1 AND (price > 1000 AND PRICE < 30000);
```

### LIKE pour faire une recherche sur un pattern:

```sql
SELECT * FROM products WHERE DESCRIPTION LIKE '%en%';
```

### IN / NOT IN pour vérifier si une valeur est présente dans une liste:

```sql
SELECT * FROM users WHERE id IN (SELECT seller_id FROM products);
```

### ORDER BY / ASC / DESC pour ordonner le résultat:

```sql
SELECT * FROM products ORDER BY PRICE DESC;
```

## RETURNING

Lorsqu'on modifie une ligne dans une table avec INSERT,DELETE ou UPDATE, il peut être utile de directement retourner les lignes modifiées
avec `RETURNING`au lieu de faire une 2eme requête pour avoir accès à ce résultat.

```sql
UPDATE users SET password = '012' WHERE email = 'alice@mail.com' RETURNING *;
```

## SQL scripts

Nous avons jusqu'à présent entrer nos commandes à la main sur le prompt Postgresql. Il est recommandé d'utiliser des fichiers scripts SQL lorsqu'on travail avec un gros volume de données que l'on exécutera avec le client `psql`

_db_app2.sql_:

```sql
CREATE DATABASE IF NOT EXISTS db_app2;
\c db_app2;
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    login VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(20) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    bio TEXT DEFAULT 'Hello, World',
    age SMALLINT CHECK (age >= 18) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

INSERT INTO users
    (login, password, email, bio, age)
    VALUES ('alice', '123', 'alice@mail.com', 'Hello, i am Alice', 18);
INSERT INTO users
    (login, password, email, bio, age)
    VALUES ('charlie', '789', 'charlie@mail.com', 'Hello, i am Charlie', 22);
INSERT INTO users
    (login, password, email, bio, age)
    VALUES ('dan', '101112', 'dan@mail.com', 'Hello, i am Dan', 44);
INSERT INTO users
    (login, password, email, bio, age)
    VALUES ('eve', '131415', 'eve@mail.com', 'Hello, i am Eve', 34);
INSERT INTO users
    (login, password, email, bio, age)
    VALUES ('fred', '161718', 'fred@mail.com', 'Hello, i am Fred', 29);
INSERT INTO users
    (login, password, email, bio, age)
    VALUES ('gibs', '192021', 'gibs@mail.com', 'Hello, i am gibds', 55);

CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    description TEXT,
    price BIGINT DEFAULT 0,
    seller_id INTEGER NOT NULL REFERENCES users(id),
    buyer_id INTEGER REFERENCES users(id)
);

INSERT INTO products
    (title, description, price, seller_id)
    VALUES ('Laptop', 'Bon etat', 20000, 5);
INSERT INTO products
    (title, description, price, seller_id)
    VALUES ('TV', 'occaz', 10000, 5);
INSERT INTO products
    (title, description, price, seller_id)
    VALUES ('Samsung', 'neuf', 15000, 1);
INSERT INTO products
    (title, description, price, seller_id)
    VALUES ('Moto', 'seulement 5000km au compteur', 400000, 1);
INSERT INTO products
    (title, description, price, seller_id)
    VALUES ('Headphones', 'copie ecouteurs apple', 500, 1);
INSERT INTO products
    (title, description, price, seller_id)
    VALUES ('Maison', 'plein sud', 90000000, 3);
INSERT INTO
    products (title, description, price, seller_id)
    VALUES ('Web app', 'Faite en react et node.js', 200000, 2);

UPDATE users SET password = '012' WHERE email = 'alice@mail.com' RETURNING *;
```

```zsh
% psql -d postgres -U db_user -a -f db_app2.sql
```

Nous pouvons ensuite nous connecter à la base db_app2:

```zsh
% psql -d db_app2 -U db_user
```
