# Projet web dev

## Objectif: create a todo list app

Rendre 2 repositories: 1 pour le frontend et 1 pour le backend

4 parties obligatoires:

- Frontend en `React`
- Backend avec `express`
- connexion avec `Squelize` ou `pg` (`pg` à tester si ca fonctionne car pas vu en cours)
- Base de données en `Postgresql`

Un système d'authentification simple avec un système d'api keys.

### Base de données

Un exemple des tables pour cette application serait:  
**users**:

- id
- name
- api_key

**todos**:

- id
- owner_id
- task (texte décrivrant la tâche)
- done : boolean pour vérifier si la tâche est effectuée ou pas
- date: date de créeation de la todos

### interface avec la base de données:

`Sequelize` ou `pg` (https://node-postgres.com/ , https://blog.logrocket.com/setting-up-a-restful-api-with-node-js-and-postgresql-d96d6fc892d8/)

### API:

Abuser de middlewares.  
Exemples: vérifier si key valide, récupérer le user qui effectue la requête etc

Exemples de routes attendues:

- `/register` => créer un user, retourner sa clé.

Faut être authentifié pour les routes suivantes:

- `/create` => app.post JSON exemple: `{"content": "Faire des courses."}`
- `/delete` => faut un id de todo, pas forcément `done = true` pour supprimer
- `/done/:id` => faut un id de todo, set `done` à `true`
- `/undone/:id` => faut un id de todo, set `done` à `false`
- `/modify` => faut un id de todo, change le content (OPTIONAL)
- `/list/:filter` => filter = 'all' ou 'undone' ou 'done'. Afficher la liste des todos en fonction du filtre.

### Frontend

Utilisez la librairie `React`
Inspirez vous des travaux que vous avez effectués avec Paulina.  
communiquer avec express via fetch ou axios
Pour effectuer des requêtes authentifiées, créer le header `'Authorization': 'mon api key'`

### conseils:

Définir les tâches, et les partager.  
Utilisez des mock datas, cad n'attendez pas que tous les composants de l'application soient liés et créés pour tester les input/output d'une partie de l'application.
