## 2

Ecrivez une requête SQL qui affiche tous les titres et descriptions des films dont la description contient le mot Amazing.

```sql
SELECT film.title, film.description FROM film WHERE film.description LIKE '%Amazing%';
```

## 3

Ecrivez une requête SQL qui récupère tous les paiements supérieurs à 10.  
Il faudra récupérer l'id, le prénom, le nom du client ainsi que le montant et la date du paiement.

```sql
SELECT c.customer_id, c.first_name, c.last_name, p.amount, p.payment_date FROM customer AS c INNER JOIN payment AS p ON c.customer_id = p.customer_id WHERE p.amount > 10;
```

## 4

Ecrivez une requête SQL qui affiche le chiffre d'affaire gagné par le video club depuis son ouverture.

```sql
SELECT SUM(amount) from payment;
```

## 5

Ecrivez une requête SQL qui affiche le titre de tous les films dont la langue est l'anglais et dont la durée est supérieure à 120 minutes.

```sql
SELECT title FROM film WHERE length > 120 AND language_id = (SELECT language_id FROM language WHERE name = 'English');
```

## 6

Ecrivez une requête SQL qui affiche le TOP 10 des clients qui ont fait le plus d'achat dans ce video club. Il faudra récupérer leur id, prénom, nom, email et le montant total de leurs achats. Il vous faudra utiliser les requêtes auxiliaires avec WITH pour cette exercice.

```sql
WITH top_10 AS (SELECT customer_id, SUM(amount) as total_amount FROM payment GROUP BY customer_id ORDER BY total_amount DESC LIMIT 10) SELECT c.customer_id, c.first_name, c.last_name, c.email, t.total_amount FROM customer AS c INNER JOIN top_10 AS t ON c.customer_id = t.customer_id ORDER BY t.total_amount DESC;
```
