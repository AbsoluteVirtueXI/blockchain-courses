# Monty hall game

## montyHall.js

Le jeu Monty hall est un jeu télévisé qui a fait débat dans la communauté mathématique.  
De grands docteurs et chercheurs en mathématique se sont déchirés (et pour certains ridiculisés) devant le casse-tête probabiliste qu'expose ce jeu.  
Evidement comme beaucoup de casse-tête probabiliste la solution est contre intuitive.

Ecrivez un programme qui simule une partie du jeu `Monty hall`.
Voici l'énoncé: https://fr.wikipedia.org/wiki/Probl%C3%A8me_de_Monty_Hall#%C3%89nonc%C3%A9

Le présentateur sera le programme, l'utilisateur sera le joueur  
Je vous propose d'utiliser un tableau de 3 éléments pour représenter les portes dans notre programme:

```js
const gates = ['goat', 'goat', 'goat'] // 3 chèvres par défaut derrière chacune des portes
```

Nous pouvons utiliser ensuite la fonction `randomInt` du module `crypto` pour générer un nombre parmi tous les index possibles du tableau pour y insérer de manière aléatoire notre la voiture.  
On utilise la fonction `randomInt` comme ci dessus:

```js
const { randomInt } = require('crypto')

const n = randomInt(0, 3) // un nombre aléatoire entre 0 et 2
```

Le jeu se passe donc en 4 étapes:

1. l'utilisateur choisit 1 porte
2. le programme affiche une chèvre dans l'une des 2 portes qu'il reste
3. l'utilisateur choisit de garder sa porte initiale ou de choisir l'autre porte qui n'est pas révélée
4. Afficher à l'utilisateur le contenu derrière les portes et lui annoncer sa victoire ou sa défaite.

## Optional

Dans un fichier _log.txt_, ajouter le nom des différents joueurs et leur lot.

## solveMontyHall.js

En vous servant du maximum de code précédemment écrit (fonctions, classes), écrivez un script qui va tester des centaines/milliers de possibilités pour les 2 cas:

- L'utilisateur change de porte
- L'utilisateur ne change pas de porte

Et afficher ensuite le pourcentage de chance de gagner si l'utilisateur change de porte versus l'utilisateur ne change pas de porte.
Nous saurons ainsi si il faut vraiment changer de porte ou pas pour avoir le maximum de chance de gagner la voiture.
