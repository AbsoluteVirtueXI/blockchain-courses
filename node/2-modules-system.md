# Modules system in node.js

## split your code!

Lorsque le code source d'un projet devient volumineux, il est nécéssaire de le diviser en plusieurs répertoires et fichiers.
Les avantages sont nombreux:

- **Dépendance déterminée**: les fichiers peuvent être dépendants les uns des autres de manière explicite.
- **Visibilité**: Les fichiers sont classés dans une arborescence, qui correspond aux fonctionnalités du programme.
- **Collaboration**: Les développeurs peuvent travailler sur des fichiers différents.
- **Maintenance et test**: Les tests et les corrections s'effectuent sur des fichiers séparés, et non plus dans un énorme fichier.
- **Sens**: On divise notre projet en unités qui ont du sens: code réseau, code front-end, code backend, etc

Dans ce cours nous allons apprendre à diviser notre programme dans plusieurs fichiers.

Pour cela nous allons utiliser le keyword `require` pour importer les éléments d'un fichier qui nous intéressent et `exports` pour à l'inverse rendre disponible des fonctions, des variables ou objects qui pourront être importés dans d'autres fichiers.

Dans le cours précédents nous avons importé `chalk` avec le code suivant:

```js
const chalk = require('chalk')
```

Si nous pouvons importer un module, c'est qu'il a obligatoirement été exporté d'un autre fichier.

Pour suivre la suite du cours, créer comme indiqué dans le cours précédent un répertoire `calc` que vous initialiserez avec `yarn` et `git`.

## **exports**:

Dans le système de modules de Node.js, chaque fichier est considéré comme un module.
On exporte du code depuis un fichier, donc un module, avec la directive `exports`:

```js
//operations.js

const add = (nb1, nb2) => {
  return nb1 + nb2
}

const sub = (nb1, nb2) => {
  return nb1 - nb2
}

const mul = (nb1, nb2) => {
  return nb1 * nb2
}

const div = (nb1, nb2) => {
  return nb1 / nb2
}

const modulo = (nb1, nb2) => {
  return nb1 % nb2
}

exports.add = add
exports.sub = sub
exports.mul = mul
exports.div = div
exports.modulo = modulo
```

On peut aussi bien exporter des constantes, des objets ou des fonctions.

```js
// constants.js

const ADD_OPERATOR = '+'
const SUB_OPERATOR = '-'
const MUL_OPERATOR = '*'
const DIV_OPERATOR = '/'
const MODULO_OPERATOR = '%'

exports.ADD_OP = ADD_OPERATOR
exports.SUB_OP = SUB_OPERATOR
exports.MUL_OP = MUL_OPERATOR
exports.DIV_OP = DIV_OPERATOR
exports.MOD_OP = MODULO_OPERATOR
```

Nous pouvons aussi exporter au moment d'une déclaration directement:

```js
// operations.js
exports.add = (nb1, nb2) => {
  return nb1 + nb2
}

exports.sub = (nb1, nb2) => {
  return nb1 - nb2
}

exports.mul = (nb1, nb2) => {
  return nb1 * nb2
}

exports.div = (nb1, nb2) => {
  return nb1 / nb2
}

exports.modulo = (nb1, nb2) => {
  return nb1 % nb2
}
```

```js
//constants.js

exports.ADD_OP = '+'
exports.SUB_OP = '-'
exports.MUL_OP = '*'
exports.DIV_OP = '/'
exports.MOD_OP = '%'
```

## **require** pour importer:

On importe dans notre fichier ce qu'un autre fichier exporte.  
On utilise pour cela la directive `require`.

```js
// main.js

const op = require('./operations') // ".js" optionnel à la fin du nom du module

let nb1 = op.add(10, 11)
console.log(nb1) // output: 21
let nb2 = op.mul(5, 3)
console.log(nb2) // output: 15
```

On peut également importer que ce qui nous intéresse avec un `destructuring assignement`:

```js
// main.js

const { mul, div } = require('./operations')

let nb1 = mul(10, 2)
console.log(nb1) // output: 20
let nb2 = div(30, 10)
console.log(nb2) // output: 3
```

## calc

Ajoutons une couche d'abstraction.
Au lieu d'appeler directement les fonctions `add`, `sub`, `mul`, `div` et `modulo` depuis notre programme principale, nous allons créer un module `calc` qui contiendra une fonction `calc`, que l'on exportera, et qui effectuera les opérations arithmétiques comme dans l'exercice [calc.js](https://github.com/AbsoluteVirtueXI/blockchain-courses/blob/master/exercices/programming/exercices-functions.md#calcjs-4)

```js
// calc.js

const { add, sub, mul, div, modulo } = require('./operations')
const { ADD_OP, SUB_OP, MUL_OP, DIV_OP, MOD_OP } = require('./constants')

exports.calc = (op, nb1, nb2) => {
  switch (op) {
    case ADD_OP:
      return add(nb1, nb2)
    case SUB_OP:
      return sub(nb1, nb2)
    case MUL_OP:
      return mul(nb1, nb2)
    case DIV_OP:
      return div(nb1, nb2)
    case MOD_OP:
      return modulo(nb1, nb2)
    default:
      return `Unknow operator ${op}`
  }
}
```

Maintenant dans notre fichier `main.js` nous pouvons importer `calc` pour effectuer toutes nos opérations arithmétiques:

```js
// main.js

const { calc } = require('./calc')

let nb1 = calc('*', 10, 2)
console.log(nb1) // output: 20
let nb2 = calc('/', 30, 10)
console.log(nb2) // output: 3
```

On exécute notre programme principal `main.js`:

```zsh
node main.js
20
3
```

Un exemple d'une calculatrice interactive: https://github.com/AbsoluteVirtueXI/calc
