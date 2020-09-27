# Modules system in node.js

## split your code!

Lorsque le code source d'un projet devient volumineux, il est nécéssaire de le diviser en plusieurs répértoires et fichiers.
Les avantages sont nombreux:

- **Dépendance determinée**: les fichiers peuvent être dépendants les uns des autres de manière explicite.
- **Visibilité**: Les fichiers sont classés dans une arborescence, qui correspond aux fonctionalités du programme.
- **Collaboration**: Les développeurs peuvent travailler sur des fichiers différents.
- **Maintenance et test**: Les tests et les corrections s'effectuent sur des fichiers séparés, et non plus dans un énorme fichier.
- **Sens**: On divise notre projet en unités qui ont du sens: code réseau, code front-end, code backend, etc

En javascript _moderne_ on utilise les mots clés `import` et `export`.
`import` sert à importer du code depuis un fichier ou module
`export` sert à exporter du code depuis un fichier ou module.

### **export**:

On exporte du code depuis un fichier avec la directive `export`:

**operation.js**

```js
//operation.js
export const add = (nb1, nb2) => {
  return nb1 + nb2
}

export const sub = (nb1, nb2) => {
  return nb1 - nb2
}

export const mul = (nb1, nb2) => {
  return nb1 * nb2
}

export const div = (nb1, nb2) => {
  return nb1 / nb2
}

export const ADD_OP = '+'
export const SUB_OP = '-'
export const MUL_OP = '*'
export const DIV_OP = '/'
```

On peut aussi bien exporter des variables, des objets ou des fonctions.
Il existe une alternative pour exporter par default une variable ou fonction qui correspondera à ce qu'on importera par défaut depuis ce fichier.

```js
const BYE_MESSAGE = 'Goodbye!!'
export default BY_MESSAGE
```

### **import**:

On importe dans notre fichier ce qu'un autre fichier exporte.  
On utilise pour cela la directive `import`.
On peut importer tout ce qu'un fichier exporte avec:
_calc.js_

```js
//calc.js
import * as op from './operation.js'
let nb = op.add(10, 11)
```

On peut également importer que ce qui nous intéresse:
_calc.js_

```js
//calc.js
import { ADD_OP, SUB_OP, mul, div } from './operation.js'
let nb = mul(10, 2)
```

Comming soon:

## ECMAScript modules vs CommonJs modules

require vs import

## Conversions

from commonjs to esm

## Usage of Third party librairies
