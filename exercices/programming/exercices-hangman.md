# Hangman game

- Interaction avec l'utilisateur: `readline-sync`
- game loop il va falloir boucler
- un dictionnaire (_dict.txt_), avec mots ligne par ligne. Pour lire `readFileSync`.
- random pour récup un mot au hasard:

```js
// Synchronous
const { randomInt } = require('crypto')

const words = ['coucou', 'toto', 'tata', 'coco']

const n = randomInt(0, words.length)
console.log(`random words: ${words[n]}`)
```

- compter points / tentatives? (dessiner en asccii un pendu: https://gist.github.com/chrishorton/8510732aa9a80a03c829b09f12e20d9c)
- comparer la lettre en upperCase ou lowerCase
- jolie interface: chalk
- Optionnel fichier de high scores:
  _score.json_

```json
{
  "Alice": 100
}
```

- check l'accès aux fichiers, check les données entrées par l'utilisateur.
- une phase d'initialisation du jeu ?? : (check, recup l'high Score)
- Optionnel: utilisation d'une classe ?

```js
class Game {
  run() {}
}
game.run()
```

- programme modulaire: modules!!!! (exports / require)

- affichage du mot en cours à découvrir sous ce format "\_ \_ \_ \_ \_ \_ \_ \_"
