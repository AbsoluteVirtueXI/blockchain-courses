# **Introduction à l'informatique et à la programmation**

Dans ce cours nous allons présenter les éléments qui font de la programmation une activité importante, intéressante et passionnante.

## Les logiciels: Softwares

Les bons logiciels, softwares en anglais, sont partout, mais ils sont invisibles.
On ne peut pas les voir, on ne peut pas sentir, on ne peut pas les toucher.
Un Software est une collection de programmes qui sont exécutés sur un ou plusieurs ordinateurs.
En général on ne peut que voir des "choses" qui contiennent ces ordinateurs:

- téléphone
- camera
- voiture
- télévision
- box internet
- ascenseur

Combien d'ordinateurs pensez vous utiliser (directement ou indirectement) en une journée ?  
Il plus de 50 ordinateurs dans une voiture, plusieurs ordinateurs dans un smart phone, des milliers d'ordinateurs gèrent votre trajet en métro ou rer.  
Lorsque vous faites vos courses en magasin, dans une ville moderne, la nourriture y est acheminée à travers le monde par des réseaux de transports et de stockages qui sont informatisés.
Ces ordinateurs ne ressemblent pas à l'image populaire que l'on se fait d'eux (avec un écran, un clavier et une souris); Ils sont de petits composants embarqués dans l'équipement qui les utilisent.  
Il y a aussi l'ordinateur de bureau classique ou votre pc portable.  
Tous ces ordinateurs exécutent des softwares. Sans ces softwares, ils ne seraient que des morceaux de métal et de plastique.
Chacune des lignes de ces softwares sont écrites par des humains.
Des millards de lignes de code dans des centaines de langages différents sont exécutées sur tous ces ordinateurs autour de nous.

## Les programmeurs

Les ordinateurs sont fabriqués par des humains pour des humains.
Les ordinateurs sont aujourd'hui des outils génériques qui peuvent être utilisés pour une multitude de tâches différentes.  
Mais il faut un programme pour rendre cet ordinateur utile.
Pour rendre un ordinateur utile il faut un programmeur.
Lorsqu'on voit un ordinateur qui fonctionne, nous oublions souvent le software qui s'exécutent dessus, et encore plus nous oublions qu'il y a un programmeur qui a écrit ce software.
Hollywood et la pop culture ont contribué (un peu moins qu'avant néanmoins) à donner une mauvaise image du programmeur: un solitaire, sale, asocial, obsédé par les jeux videos et par pirater le pc des autres. Et C'est presque toujours un homme.
Le développement d'une application est un activité qui implique des dizaines à des milliers de collaborateurs issus de champs différents:

- programmeurs frontend
- programmeurs backend
- programmeurs de smart contracts
- devops
- architectes logiciels
- UI/UX designers
- testers
- community managers
- chef de projet
- administrateurs systèmes
- administrateurs réseaux
- administrateurs sécurité
- techniciens bureautique
- ingénieurs qualité
- marketing
- commerciaux
- product manager
- Vous pouvez en trouver plus ?

**Le développement d'application est un travail d'équipe**
De plus programmer vous amènera à vous intéresser aux différents domaines que vos programmes devront traiter.
Dans le cas de la Blockchain vous serez amené à vous intéresser à la finance si vous développez des smart contracts de DEFI.  
Si vous développez un jeu video fantasy, vous serez amené à vous intéresser à l'univers de Tolkien, et aux bestiaires fantastiques de heroic fantasy.  
Par exemple l'univers du jeu video `Darkest Dungeon` est inspiré des oeuvres de `H. P. Lovecraft`.
Il faut éviter la "all I care about is computers and programming" attitude.  
Même si le but de cette formation est de faire de vous des développeurs, et donc de beaucoup programmer, il faut garder à l'esprit qu'un bon développeur est un team player, qui comprend le rôle de son code dans un projet.
Le "tout pour la technique" est une erreur commune des développeurs juniors.

## Les environnements d'exécution

Les exemples précédents mettaient surtout en avant la programmation ordinateurs physiques.
Ces ordinateurs sont l'environnement d'exécution de nos programmes.
Mais cet environnement d'exécution peut aussi être un logiciel!!
En anglais `runtime environment`. C'est un programme qui permet d'exécuter d'autres programmes.
On nomme aussi ces `runtime environment` des `interpréteurs`.  
Le `runtime environment` doit être installé sur l'ordinateur. Nous pourrons ensuite lui passer nos scripts/code source/bytes code afin qu'il puisse les interpréter/exécuter.

### Compilé vs Interprété

_Modèle d'exécution natif_:  
**CPU <=> Operating System <=> Binaire / code source compilé**  
Dans ce modèle le fichier binaire est le résultat d'une compilation d'un code source texte.
Les compilateurs les plus connus sont `gcc`, `clang`, `MSVC/CL`, `rustc`, `go`.  
Avantage: Les programmes compilés sont plus proches de la machine, `bare metal`, ils sont exécutés plus rapidement.
Désavantage: Il faudra recompiler le code source si l'on veut s'exécuter sur un autre système d'exploitation ou un autre type de processeur.

_Modèle d'exécution interprété_:  
**CPU <=> Operating System <=> Interpréteur <=> code source texte**  
Dans ce modèle le code source texte (Python, JS, Lisp, Lua) est interprété/exécuté directement par l'interpréteur.  
Avantage: le code source peut être interpreté par n'importe quel interpréteur que ce soit sur Windows, Linux ou macOS, tant qu'un interpréteur est installé sur le système d'exploitation.
Désavantage: Les programmes sont plus lents, mais ce n'est généralement pas un problème dans le dev web.

Dans le cadre de notre formation nous programmerons pour des runtime environnement.

### Navigateurs web

En anglais browsers.
Les browsers possèdent tous un `Javascript runtime environment`:

- Firefox: SpiderMonkey
- Chrome: V8 JavaScript engine

Ce runtime permet à vos navigateurs de d'exécuter du code javascript.

### Server side

Pour exécuter du code javascript directement sur notre ordinateur ou sur un serveur distant il faudra installer `Node.js`.  
`Node.js` est un `Javascript runtime environment` qui exécute des scripts Javascript sur votre ordinateur.  
_hello.js_:

```js
for (let i = 0; i < 10; ++i) {
  console.log('Hello HardFork!')
}
```

Exécution en ligne de commande avec `Node.js` sur la console:

```zsh
% node hello.js
Hello HardFork!
Hello HardFork!
Hello HardFork!
Hello HardFork!
Hello HardFork!
Hello HardFork!
Hello HardFork!
Hello HardFork!
Hello HardFork!
Hello HardFork!
```

`Node.js` utilise le V8 Javascript engine.

### Ethereum

Les smart contracts que vous déploierez sur Ethereum seront exécutés par un `runtime environnment` appelé l'`EVM` pour `Ethereum Virtual Machine`.  
A la différence des runtime JS, le code source `Solidity` n'est pas déployé directement, mais une étape intermédiaire de compilation est nécéssaire, pour compiler le code source `Solidity` en `Bytecode`.
(De nombreux langages utilisent en realité ce procédé tel que `ruby`, `java`, `C#`)
