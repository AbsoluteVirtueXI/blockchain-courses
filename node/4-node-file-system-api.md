# Node.js file system API

## **introduction au module `fs`**:

`fs` pour File system (système de fichier).  
Dans Node.js toutes les fonctions qui ont accès au système de fichiers sont importables depuis le module **fs**.  
Documentation officielle de l'API **fs**: https://nodejs.org/api/fs.html  
Le module `fs` est natif à Node.js, donc pas besoin d'utiliser `yarn` pour l'installer.
`axios`, `chalk` ou `readline-sync` sont des packages écrits par la communauté, qui ne sont pas intégrés nativement à Node.js.  
Le module `fs` est un `core module`, ou `built-in module`, c'est un élément essentiel à Node.js.

Nous pouvons importer le module `fs` avec le code suivant:

```js
const fs = require('fs')
```

Le module `fs` nous donne accès à toutes les fonctions qui peuvent par exemple nous permettre:

- de lire un fichier: `fs.readFileSync`
- d'écrire dans une fichier: `fs.writeFileSync`
- copier un fichier: `fs.copyFileSync` (copier un ficher est une combinaison de `readFileSync` et `writeFileSync`)
- supprimer un fichier: `fs.unlinkSync`
- récupérer des informations sur un fichier (taille, date de création,etc...): `fs.statSync`

Pour une liste exhaustive des toutes les fonctions, synchrones et asynchrones disponibles dans le module `fs`:https://nodejs.org/api/fs.html

Pour le moment nous ne travaillerons qu'avec les versions synchrones de l'api: https://nodejs.org/api/fs.html#fs_synchronous_api
Pour chaque fonctions du module `fs` il existe 3 versions:

- synchrone: ces fonctions finissent toutes avec le préfixe `Sync`
- asynchrone avec `callback`
- asynchrone avec `promises` elles sont accessibles depuis le sous module `fs/promises`.

## Usage

### read a file

https://nodejs.org/api/fs.html#fs_fs_readfilesync_path_options

Lire le contenu du fichier _./file.txt_ (depuis le répertoire courant d'exécution) et l'afficher sur l'écran:

```js
const { readFileSync } = require('fs')

const txt = readFileSync('./file.txt', 'utf-8')
console.log(txt)
```

### write to a file

https://nodejs.org/api/fs.html#fs_fs_writefilesync_file_data_options

Ecrire des données dans un fichier _./original.txt_

```js
const { writeFileSync } = require('fs')

writeFileSync('./original.txt', 'Hello HardFork!!!')
```

### copy a file

Pour copier un fichier pour pouvons utiliser une combinaison de `readFileSync` et `writeFileSync`:

```js
const { readFileSync, writeFileSync } = require('fs')

// Lire le contenu du fichier original.txt et l'assigner à txt
const txt = readFileSync('./original.txt', 'utf-8')

/*
  Avant de copier nous pouvons effectuer un traitement sur la variable txt, 
  extraire ou rajouter des élements à copier
*/

// Ecrire le contenu de la variable txt dans copy.txt
writeFileSync('./copy.txt', txt)
```

Nous pouvons aussi directement utiliser la fonction `copyFileSync`:
https://nodejs.org/api/fs.html#fs_fs_copyfilesync_src_dest_mode

```js
const { copyFileSync } = require('fs')

// copie original.txt vers copy.txt
copyFileSync('./original.txt', './copy.txt')
```

### delete a file

https://nodejs.org/api/fs.html#fs_fs_unlinksync_path

```js
const { unlinkSync } = require('fs')

// delete copy.txt file
unlinkSync('./copy.txt')
```

### read a directory / listing a directory content

https://nodejs.org/api/fs.html#fs_fs_readdirsync_path_options

```js
const fs = require('fs')

// list current directory './'
const list = fs.readdirSync('./')
console.log(list) // output: [.git, .gitignore, package.json, main.js, node_modules, yarn.lock]
```

### create a directory

https://nodejs.org/api/fs.html#fs_fs_mkdirsync_path_options

```js
const { mkdirSync } = require('fs')

mkdirSync('./newdirectory')
```

### delete a directory

https://nodejs.org/api/fs.html#fs_fs_rmdirsync_path_options

```js
const { rmdirSync } = require('fs')

rmdirSync('./newdirectory')
```

### check if a path exists

https://nodejs.org/api/fs.html#fs_fs_existssync_path

```js
const { existsSync } = require('fs')

// existsSync returns a boolean

if (existsSync('/etc/passwd')) {
  console.log('The path exists.')
} else {
  console.log('The path does not exists.')
}

if (existsSync('./newdirectory')) {
  console.log('The path exists.')
} else {
  console.log('The path does not exists.')
}
```

## examples

### countVowel.js

Dans l'exercice [countVowel.js](https://github.com/AbsoluteVirtueXI/blockchain-courses/blob/master/exercices/programming/exercices-numbers-and-strings.md#countvoweljs) nous devions compter le nombre de voyelles dans un poème.  
La correction est accessible [ici](https://github.com/AbsoluteVirtueXI/blockchain-courses/blob/master/exercices/programming/corrections-numbers-and-strings.md/countVowel.js).

Nous pouvons désormais appliquer ce programme `countVowel.js` à n'importe quel fichier passé sur la ligne de commande:

- Le programme de traitement des voyelles est déjà crée
- Nous récupérerons le nom du fichier à traiter via `process.argv[2]`
- Nous utiliserons `fs.existsSync`pour vérifier que le fichier existe.
- Nous utiliserons `fs.readFileSync` pour lire le fichier récupérer le contenu de ce fichier comme une `string`

```js
const fs = require('fs')

// verifier la cmd line
if (process.argv.length !== 3) {
  console.log(`usage: node countVowel.js file.txt`)
  process.exit(1)
}

// check if file exists
if (!fs.existsSync(process.argv[2])) {
  console.log(`Error: ${process.argv[2]} does not exist`)
  process.exit(1)
}

// est ce un fichier ?
const stats = fs.statSync(process.argv[2])
if (!stats.isFile()) {
  console.log(`Error: ${process.argv[2]} is not a file`)
  process.exit(1)
}

// lire le fichier
let text = fs.readFileSync(process.argv[2], 'utf-8')
text = text.toLowerCase()

let nbA = 0
let nbE = 0
let nbI = 0
let nbO = 0
let nbU = 0
let nbY = 0

for (let i = 0; i < text.length; ++i) {
  if (
    text[i] === 'e' ||
    text[i] === 'é' ||
    text[i] === 'è' ||
    text[i] === 'ê'
  ) {
    ++nbE
  } else if (text[i] === 'a') {
    ++nbA
  } else if (text[i] === 'i') {
    ++nbI
  } else if (text[i] === 'o') {
    ++nbO
  } else if (text[i] === 'u') {
    ++nbU
  } else if (text[i] === 'y') {
    ++nbY
  }
}

console.log(`nb E: ${nbE}`)
console.log(`nb A: ${nbA}`)
console.log(`nb I: ${nbI}`)
console.log(`nb O: ${nbO}`)
console.log(`nb U: ${nbU}`)
console.log(`nb Y: ${nbY}`)
```

A tester sur:

```text
Je suis le Ténébreux, – le Veuf, – l’Inconsolé,
Le Prince d’Aquitaine à la Tour abolie :
Ma seule Etoile est morte, – et mon luth constellé
Porte le Soleil noir de la Mélancolie.

Dans la nuit du Tombeau, Toi qui m’as consolé,
Rends-moi le Pausilippe et la mer d’Italie,
La fleur qui plaisait tant à mon coeur désolé,
Et la treille où le Pampre à la Rose s’allie.

Suis-je Amour ou Phébus ?… Lusignan ou Biron ?
Mon front est rouge encor du baiser de la Reine ;
J’ai rêvé dans la Grotte où nage la sirène…

Et j’ai deux fois vainqueur traversé l’Achéron :
Modulant tour à tour sur la lyre d’Orphée
Les soupirs de la Sainte et les cris de la Fée.
```

### ls.js

Implémentation de la commande `ls` simplifiée.

```js
const fs = require('fs')

// check if 3 elements on the command line (we need 1 argument for our program)
if (process.argv.length !== 3) {
  console.log('usage: node ls.js directory')
  process.exit(1)
}

// check if path (3rd argument) exists
if (!fs.existsSync(process.argv[2])) {
  console.log(`Error: ${process.argv[2]} does not exist`)
  process.exit(1)
}

// check if path (3rd argument) is a directory
if (!fs.statSync(process.argv[2]).isDirectory()) {
  console.log(`Error: ${process.argv[2]} is not a directory`)
  process.exit(1)
}

// get content of directory and print it, 1 element per line
let tab = fs.readdirSync(process.argv[2])
tab.forEach((elem) => {
  console.log(elem)
})
```
