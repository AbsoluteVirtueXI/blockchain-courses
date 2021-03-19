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
