# Error handling with exceptions

Nous ne discuterons dans ce cours que des erreurs opérationnelles.  
C'est à dire des erreurs que l'on peut rencontrer au moment de l'exécution de programmes correctement écrits.  
Ces erreurs ne sont pas considérées comme des bugs, et sont souvent des erreurs liées au:

- système: par exemple la manipulation de processus ou de fichiers
- réseau: internet down pendant l'exécution du programme, un serveur surchargé, ou l'accès à une url qui n'existe pas
- interaction avec l'utilisateur: input de l'utilisateur invalide
- ...?

## Principles

Gérer les erreurs possibles dans nos programmes est un travail fastidieux, mais nécéssaire.  
La hantise du développeur est que son programme crash, qu'une action non anticipée à l'écriture du programme entraîne un état indéfini résultant en son interruption.  
Il faut garder à l'esprit qu'il est toujours bon pour un développeur qu'une erreur entraîne un crash du programme, car ces erreurs sont détectables et peuvent donc être corrigées.  
Les erreurs qui n'entrainent pas de crash, sont bien plus difficiles à détecter et à corriger.
L'idéal est évidement d'être exhaustif sur la totalité des erreurs possibles et de les gérer correctement afin que notre programme puisse répondre correctement si ces erreurs se produisent.  
**Mais cela est impossible manuellement**.

Précédemment nous avons constaté que la fonction `readFileSync` du module `fs` pouvait faire crasher notre programme si le fichier à lire n'existe pas:

```js
// prog-readfile.js
const fs = require('fs')
const txt = fs.readFileSync('hello', 'utf-8') // fichier hello n'existe pas
console.log(txt)
```

```zsh
node prog-readfile.js
node:internal/fs/utils:306
    throw err;
    ^

Error: ENOENT: no such file or directory, open 'hello'
```

Nous avons donc rajouté un contrôle pour éviter ce crash: vérifier que le path passé à `readFileSync` existe avant d'appeler cette fonction:

```js
// prog-readfile.js
const fs = require('fs')
if (!fs.existsSync('hello')) {
  console.log('Error: file does not exist')
  process.exit(1)
}
const txt = fs.readFileSync('hello', 'utf-8')
console.log(txt)
```

Si _hello_ n'existe pas un message clair sera affiché à l'utilisateur:

```zsh
node prog-readfile.js
Error: file does not exist
```

Si _hello_ existe un le contenu du fichier _hello_ sera affiché sur la console:

```zsh
node prog-readfile.js
hello world!!
```

Mais si _hello_ est un répertoire on crash de nouveau:

```js
node prog-readfile.js
node:internal/fs/utils:306
    throw err;
    ^

Error: EISDIR: illegal operation on a directory, read
```

Nous avons donc rajouté un contrôle supplémentaire pour éviter ce crash: vérifier que le path passé à `readFileSync` est un fichier:

```js
// prog-readfile.js
const fs = require('fs')
if (!fs.existsSync('hello')) {
  console.log('Error: file does not exist')
  process.exit(1)
}
if (!fs.statSync('hello').isFile()) {
  console.log('Error: not a file')
  process.exit(1)
}
const txt = fs.readFileSync('hello', 'utf-8')
console.log(txt)
```

Si _hello_ n'est pas un fichier un message clair sera affiché à l'utilisateur:

```zsh
node prog-readfile.js
Error: file does not exist
```

Si _hello_ est un fichier qui existe le contenu du fichier _hello_ sera affiché sur la console:

```zsh
node prog-readfile.js
hello world!!
```

Nous gérons 2 cas de crash possible, mais il en existe d'autres...
Beaucoup d'autres : https://man7.org/linux/man-pages/man3/errno.3.html
Les erreurs les plus communes que l'on rencontre lorsqu'on fait de la programmation système sont: https://nodejs.org/api/errors.html#errors_common_system_errors
On retrouve bien les deux erreurs que l'ont a rencontré avec notre exemple précédent:

- `ENOENT`: No such file or directory (POSIX.1-2001).
  Typically, this error results when a specified pathnamedoes not exist, or one of the components in the directory prefix of a pathname does not exist, or the specified pathname is a dangling symbolic link.
- `EISDIR`: EISDIR Is a directory (POSIX.1-2001).
  An operation expected a file, but the given pathname was a directory.

Essayons de trigger cette erreur: `EACCES` pour un accès à un fichier interdit par ses permissions.  
Changeons les permissions du fichier _hello_ pour que la lecture soit interdite pour tous les utilisateurs du système:

```zsh
chmod -r hello
```

Exécutons de nouveau notre programme _prog-readfile.js_:

```zsh
node prog-readfile.js
node:internal/fs/utils:306
    throw err;
    ^

Error: EACCES: permission denied, open 'hello'
```

Pour que notre programme devienne résilient aux erreurs il faut être exhaustif dans la gestion de toutes ces erreurs. Au lieu de gérer chacune des erreurs possibles, et d'effectuer les tests appropriés avant l'appel de fonctions qui peuvent crasher notre programme, nous allons utiliser les `exceptions` pour gérer ces erreurs et ainsi éviter à notre programme de crasher et de répondre de manière appropriées aux erreurs possibles.

## Exceptions

Une fonction possède des inputs, sous forme d'arguments, et retourne un ouput (une valeur) ou effectue un side effect (afficher sur la console).  
En javascript si une fonction ne retourne rien explicitement, `undefined` sera retourné.
Initialement la question de comment retourner une erreur à toujours tourmenter les développeurs.
En effet les langages compilés qui servent à écrire des systèmes d'exploitations ou même à écrire d'autres langages (comme node.js qui écrit en C et C++) sont typés.  
Le type de la valeur de retour doit être respecté et unique, que l'on retourne une valeur correcte ou une erreur.
Il était donc très difficile pour un dévelopeur qui utilise une fonction de savoir si la valeur qu'il reçoit est une valeur correcte ou une erreur.
Il fallait donc un autre canal pour communiquer si effectivement la fonction retourne une valeur correcte ou une erreur.
On utilise les exceptions pour communiquer sur ce canal.
Si une fonction a été implémentée avec une gestion de ses erreurs avec des exceptions, `exception handling`, alors l'appelant pourra:

- récupérer la valeur de retour de cette fonction si elle s'exécute sans erreurs
- récupérer l'exception qui a été levée par la fonction et réagir "proprement" avant que le programme crash

Si une exception est levée(`throw`) et qu'elle n'est pas `catch` dans l'une des fonctions appelantes de la `call stack` (pille d'appel/d'exécution) alors le programme crash.

```js
// main.js
const func1 = () => {
  func2()
}

const func2 = () => {
  func3()
}

const func3 = () => {
  throw new Error('gonna crash') // throw an exception
}

func1()
```

Heureusement pour nous toutes les fonctions qui sont susceptibles de crasher, `throw` des exceptions que l'on peut `catch` et ainsi nous pouvons réagir aux erreurs.
Ce sont des fonctions qui utilisent le système de fichiers ou le réseau généralement.
Lorsque notre programme précédent crashait, c'est parceque la fonction `readFileSync` `throw` une exception et qu'on ne la `catch` pas.

## Handling exceptions with `try`/`catch`/`finally`

Afin de gérer toutes les exceptions d'un block de code nous utilisons les keywords `try` et `catch`.
Dans le block du `try` nous écrivons le code qui est susceptible de `throw` une exception.  
`catch` nous sert à réagir sur une exception particulière ou comme ci dessous à n'importe quelles exceptions:

```js
// prog-readfile.js
const fs = require('fs')
try {
  const txt = fs.readFileSync('hello', 'utf-8') // readFileSync peut throw differents types d'exceptions
  console.log(txt)
} catch (e) {
  // catch toutes les exceptions
  console.error('An error somewhere') // write to stderr instead of stdout
}
```

Si par exemple _hello_ n'existe pas, si c'est un répertoire, si les droits de lecture sont interdits ou toutes autres exceptions alors en exécutant ce programme nous afficherons:

```zsh
node prog-readfile.js
An error somewhere
```

Notre programme ne crash plus peu importe l'erreur et donc peu importe l'exception qui a été `throw` par `readFileSync`.

Si la fonction que l'on appelle et qui échoue gère correctement les erreurs, l'exception récupérée par un `catch` possède de nombreuses informations utiles, comme le code d'erreur, le message d'erreur , etc...
Rien de magique, l'exception est un objet qui hérite de la classe `Error`.
Classe `Error`: https://nodejs.org/api/errors.html#errors_class_error  
Classe `SystemError` qui hérite de `Error`: https://nodejs.org/api/errors.html#errors_class_error

```js
// prog-readfile.js
const fs = require('fs')
try {
  const txt = fs.readFileSync('hello', 'utf-8') // readFileSync peut throw differents types d'exceptions
  console.log(txt)
} catch (e) {
  // catch toutes les exceptions
  console.error('An error somewhere') // write to stderr instead of stdout
  console.error(`name: ${e.name}`) // nom de l'erreur, en général c'est le nom de la classe
  console.error(`code: ${e.code}`) // code de l'erreur
  console.error(`message: ${e.message}`) // message de l'erreur
  console.error(`stack: ${e.stack}`) // la stack frame pour voir les appels successifs jusqu'a l'erreur
}
```

Désormais il faudra vérifier comment une api, ou un ensemble de fonctions d'un package gère ses erreurs pour les faire de `expcetion handling` correctement.
Par exemple pour le package `axios` qui nous permet de faire des requêtes http: https://github.com/axios/axios#handling-errors

Pour récrire complètement notre programme précédent avec les bons messages d'erreurs que nous afficherons à l'utilisateurs nous pourrions faire un affichage conditionnel en fonction du code d'erreur `e.code`:

```js
// prog-readfile.js
const fs = require('fs')
try {
  const txt = fs.readFileSync('hello', 'utf-8') // readFileSync peut throw differents types d'exceptions
  console.log(txt)
} catch (e) {
  // catch toutes les exceptions
  if (e.code === 'ENOENT') {
    console.error(`Error: ${e.code}: file does not exist`)
  } else if (e.code === 'EISDIR') {
    console.error(`Error: ${e.code}: is a directory`)
  } else if (e.code === 'EACCES') {
    console.error(`Error: ${e.code} access denied`)
  } else {
    console.log(e.message)
  }
} finally {
  // will always execute
  console.log('Thank you for using prog-readfile.js')
}
```

Dans le bloc précédent nous utilisons un `finally`.  
C'est très utile si on veut qu'un bloc de code s'exécute de manière inconditionnelle après un `try` ou `catch`.
Si le code dans le bloc du `try` a levé ou pas une exception, `console.log('Thank you for using prog-readfile.js')` sera exécuté quoi qu'il arrive.

## throwing exceptions with `throw`

Pour lever une exception depuis nos propres fonctions on utilise le mot clé `throw`.
Il faudra utiliser un `try/catch/finally` pour récupérer l'exception.

```js
// In a pong game we can only move UP/DOWN direction
const move = (direction) => {
  switch (direction.toUpperCase()) {
    case 'UP':
      console.log('moving up')
      break
    case 'DOWN':
      console.log('moving down')
      break
    default:
      throw new Error('invalid direction')
  }
}

try {
  move('up')
  move('down')
  move('left')
} catch (e) {
  console.log(e.message)
}
```

## custom errors by extending `Error`

Dans l'exemple précédent notre exception qui est une instance de la classe `Error` ne possède qu'un message `invalid direction`, c'est l'argument passé à la classe `Error` et qui sera par défaut accessible par la propriété `message`.  
Dans un véritable programme il est possible que nous ayons besoin d'une véritable gestion des erreurs customisées et spécifiques à notre projet.
Pour cela il faudra hériter de la classe `Error` et ajouter les propriétés qui nous intéressent

```js
const fs = require('fs')

const DICT_FILE_ERROR = { code: 'DICT_FILE_ERROR', errno: 1 }
const SCORE_FILE_ERROR = { code: 'SCORE_FILE_ERROR', errno: 2 }
const DICT_PATH = 'dict.txt'
const SCORE_PATH = 'score.json'

class GameError extends Error {
  constructor(message, error) {
    super(message)
    this.name = 'GameError'
    this.code = error.code
    this.errno = error.errno
  }
  toString() {
    return `${this.name} ${this.code}: ${this.message}`
  }
}

class Game {
  init() {
    try {
      const dictContent = fs.readFileSync(DICT_PATH)
      // ..... do something with txt .....
    } catch (e) {
      throw new GameError(e.message, DICT_FILE_ERROR)
    }
    try {
      const scoreContent = fs.readFileSync(SCORE_PATH)
      const score = JSON.parse(scoreContent)
    } catch (e) {
      throw new GameError(e.message, SCORE_FILE_ERROR)
    }
  }
  run() {
    while (true) {
      console.log('Startint the game')
      break // to avoid endless loop for the code sample
    }
  }
}

const game = new Game()
try {
  game.init()
  game.run()
} catch (e) {
  console.error(e.toString())
}
```
