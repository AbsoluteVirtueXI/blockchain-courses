# exercices évalués

Ces exercices devront tous être pushés sur un repository accessible depuis github.  
Ce repository devra se nommer `exo-node-3`.  
Suivez les instructions des cours précédents pour initialiser votre répertoire de travail en package Node.js avec `yarn init`.  
Vous devrez fournir le lien de votre repo github dans le formulaire de rendus d'exercices suivant: https://forms.gle/LGU4QsFF3fAEoJ7Q6
Essayez d'aller le plus loin possible.  
Certains exercices nécessitent une réflexion approfondie prenez votre temps pour anticiper les différentes étapes que devra traiter votre programme.

L'évaluation de ces exercices s'effectuera sur les éléments suivants:

- fonctionnalité du programme
- principes d'asynchronicité respectés
- modularité du programme
- gestion des erreurs
- Elégance algorithmique
- commentaires
- anticipation de nouvelles fonctionnalités

## server.js

Vous devrez créer un serveur express pour fournir un ensemble de service de calculs
Vous devrez implémenter l'ensemble de ces services via des routes `app.get`.

Implémenter 5 routes qui retournera le résultat des 5 opérations arithmétiques: `+`, `-`, `*`, `/`, `%`.
ces opérations devront être accessibles comme si dessous:

- `/calc/add/1/2` pour effectuer une addition de 1 et 2
- `/calc/sub/10/2` pour effectuer une soustraction de 10 par 2
- `/calc/mul/12/4` pour effectuer une multiplication de 12 par 4
- `/calc/div/10/2` pour effectuer une division de 10 par 2
- `/calc/mod/13/4` pour effectuer un modulo de 13 par 4

Le résultat sera retourné en tant que string JSON avec le format suivant:

```json
{
  "op": "add",
  "op1": 1,
  "op2": 2,
  "result": 3
}
```

Cette réponse serait obtenu avec une requête sur http://localhost:3333/calc/add/1/2  
En cas d'erreur sur l'opération il faudra remplacer l'attribut `result` par un attribut `error` qui contiendra un message d'erreur sur l'opération

## client.js

Créer un script `client.js` qui utilisera chacune des routes de notre serveur express au moins une fois.
Ce script devra exécuter les requêtes sur notre serveur en parallèles

## web-info.js

Ecrire un script `web-info.js` qui récupérera les informations d'un site et les écrira sous un format `json`.

```zsh
node web-info.js https://en.wikipedia.org/wiki/Fravia
```

générera un fichier `info.json` sous ce format:

```json
{
  "url": "https://en.wikipedia.org/wiki/Fravia",
  "contentLength": 91942,
  "title": "Fravia - Wikipedia",
  "nbUrls": 341,
  "nbImgs": 4
}
```

Vous devrez utiliser pour cela la librairie `axios` et `jsdom`

### Amélioration

- Assurez vous que le fichier json généré possède un nom de fichier unique et non plus le nom générique `info.json`
- Ajouter des informations que vous semblez intéressantes qui devraient figurer dans les fichiers `json` généré
