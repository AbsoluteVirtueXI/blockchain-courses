# Introduction

Documentation officielle: https://docs.soliditylang.org/en/latest/

Lorsque vous consultez une documentation officielle, vérifiez toujours à quelle version s'applique la documentation que vous lisez.  
Si vous cherchez des informations sur Solidity dans votre moteur de recherche il est très probable que vous tombiez sur des anciennes informations.  
Ces informations peuvent ne plus être applicables à la dernière version de Solidity.  
Actuellement la dernière version de Solidity est `0.8.4`.

## Solidity: A language designed for the Ethereum Virtual Machine

Solidity est un petit langage, qui n'a été prévu que pour écrire des smart contracts, il a été spécifiquement désigné pour cela, ce n'est pas un **General-purpose programming languages**

### A Statically typed language

Solidity est un langage orienté objet de haut niveau à typage fort.
Typage fort signifie que le type de toutes nos variables, ainsi que les paramètres de nos fonctions et leurs valeurs de retour doivent avoir un type définit dés la compilation (typage fort statique), ou au moins avant leur exécution (typage fort dynamique).  
Javascript est un langage à typage faible, il ne nous oblige pas à définir le type de toutes nos variables, des paramètres de nos fonctions et de leur valeur de retour.

> Solidity is statically typed, supports inheritance, libraries and complex user-defined types among other features.

La fonction `add` ci dessus effectue une addition et retourne le résultat.
Nous remarquons que les paramètres `nb1` et `nb2` sont de type `uint256`, c'est à dire un entier non signé, positif, de 256 bits, de 0 à 2^256 - 1. En décimal 2^256 - 1 s'exprime 115,792,089,237,316,195,423,570,985,008,687,907,853,269,984,665,640,564,039,457,584,007,913,129,639,935.

```solidity
function add(uint256 nb1, uint256 nb2) public pure returns(uint256) {
    return nb1 + nb2;
}
```

`public` est un `visibility specifier`, il spécifie que notre fonction est visible/accessible depuis l'extérieur de notre smart contract et aussi depuis du code interne à notre smart contract. C'est la visibilité la plus permissive.  
les autres `visibility specifiers` sont:

- `private`: fonction ou variable seulement visible dans le smart où elles sont définies.
- `external`: seulement pour les fonctions, visible seulement depuis l'extérieur de ce smart contract
- `internal`: fonction ou variable seulement visible dans le smart contract courant et dans les smart contracts qui en hérite.

`pure` est un `modifier` de fonctions qui interdit à notre fonction de lire ou de modifier le state de notre contrat.
`view` est un autre `modifier` de fonctions qui autorise la lecture du state de notre contract mais qui interdit la modification.
Si ni `pure` et ni `view` sont utilisés comme `modifier` d'une fonction alors cette fonction est autorisée à lire et modifier le state de notre smart contract.  
Le state du contrat sont les variables qui constituent le `storage`.

Javascript est plus permissif:

```js
const add = (nb1, nb2) => {
  return nb1 + nb2
}
```

Prenez bien cette habitude, lorsque vous écrivez du code en `Solidity` **toutes** les variables, paramètres et valeurs de retour de vos fonctions possèdent un type.

### A modular programming language

Solidity est modulaire.  
Comme pour Javascript nous pouvons écrire des contrats dans différents fichiers et importer les fichiers qui contiennent les fonctionnalités qui nous intéresse.
Cette fonctionnalité est utile lorsque nous souhaitons importer un smart contract dont on souhaite hériter, une `interface` que nous souhaitons implémenter ou une `library` que nous souhaitons utiliser.
Depuis remix nous pouvons importer le smart contract `ERC20` du fichier _ERC20.sol_ qui est accessible sur le repository d'OpenZepplin à l'url: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.1.0/contracts/token/ERC20/ERC20.sol  
_FirstToken.sol_:

```solidity
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.1.0/contracts/token/ERC20/ERC20.sol";

contract FirstToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("FirstToken", "FST") {
        _mint(msg.sender, initialSupply);
    }
}
```

Dans l'exemple précédent nous importons le fichier _ERC20.sol_ qui contient le smart contract `ERC20`.  
Nous héritons de ce smart contract afin d'en utiliser les fonctionnalités avec `contract FirstToken is ERC20`.  
Nous devons ensuite dans notre `constructor` aussi faire appel au `constructor` de notre parent `ERC20`.  
Nous remarquons donc que `Solidity` est un langage objet qui permet de faire de l'héritage (inheritance).
Vous pouvez lire le fichier _ERC20.sol_ à l'url: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol

### An Object oriented language

Solidty est un langage dont la syntaxe se rapproche fortement du C++, java ou encore Javascript. On peut le décrire comme un langage C-Like.

> Solidity was influenced by C++, Python and JavaScript and is designed to target the Ethereum Virtual Machine (EVM).

Solidity suit le paradigme OOP afin d'attirer le maximum de développeurs qui sont habituée au concept de l'OOP des langages mainstream.

Les smart contracts se composent comme les classes d'un langage orienté objet.  
Les smart contracts possèdent des variables qui correspondent au `storage` et des fonctions qui peuvent lire ou modifier ce `storage`, comme une classe posséderait des propriétés et des méthodes.  
Tout comme une classe, les smart contracts possèdent un `constructor` qui peut prendre des paramètres et qui sera exécuté au moment du déploiement du smart contract. Le `constructor` permet d'initialiser les variables de notre smart contract et d'effectuer des opérations d'initialisation nécessaires au moment du déploiement.  
Le `constructor` est optionnel, s'il n'est pas présent alors un `constructor` vide sera implicitement crée par défaut.  
Un smart contract déployé est l'équivalent d'une instance de classe. Comme pour une classe `this` correspond à l'instance d'un smart contract.  
Un smart contract peut être crée depuis l'extérieur de la blockchain via une transaction Ethereum, `Off-chain`, ou par un autre smart contract, `On-chain`.

_Counter.sol_:

```solidity
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Counter {
  mapping(address => bool) _owners;
  uint256 private _counter;
  uint256 private _step;

  constructor(uint256 step_) {
    _owners[msg.sender] = true;
    _step = step_;
  }

  function addOwner(address account) public {
      require(_owners[msg.sender] == true, "Counter: Only an owner can add owner");
      _owners[account] = true;
  }

  function increment() public {
      require(_owners[msg.sender] == true, "Counter: Only owners can increment counter");
      _counter += _step;
  }

  function reset() public {
      require(_owners[msg.sender] == true, "Counter: Only owners can reset counter");
      _counter = 0;
  }

  function isOwner(address account) public view returns (bool) {
      return _owners[account];
  }

  function counter() public view returns (uint256) {
      return _counter;
  }

  function step() public view returns (uint256) {
      return _step;
  }

}
```

`address` est un type qui correspond à une adresse sur Ethereum. Cette adresse peut être un account, ou celle d'un smart contract.  
`msg.sender` est une [global variables](https://docs.soliditylang.org/en/latest/cheatsheet.html#global-variables). `msg.sender` correspond à l'adresse Ethereum qui fait appel à notre fonction, adresse d'un account ou smart ou d'un smart contract. `msg.sender` est du type `address`.  
le `constructor` prend un paramètre `step_` qui sera passé au moment du déploiement et qui initialisera la variable d'état `_step`.  
De plus le `constructor` initialisera également le `mapping` `_owners` en associant l'adresse qui aura effectué la transaction de création du smart contract à `true`.  
Un `mapping` est une structure de donnée qui associe une clef à une valeur, dans l'exemple précédent une `address` sera associée à un `bool`. Si une `address` est associée à `true` alors l'adresse sera considéré comme un owner et pourra appeler les fonctions `addOwner`, `increment` et `reset` sans `revert` la transaction.  
`require` nous permet de `revert` la transaction, l'annuler, et d'envoyer un message si la condition, 1er argument du `require`, est évaluée à `false`.  
L'équivalent de

```solidity
function increment() public {
    require(_owners[msg.sender] == true, "Counter: Only owners can increment counter");
    _counter += _step;
}
```

serait

```solidity
function increment() public {
    if(_owners[msg.sender] == false) {
        revert("Counter: Only owner can increment counter");
    }
    _counter += _step;
}
```

le message d'erreur passé au `require` est de type `string`.
De plus nous avons vu dans le chapitre précédent que `Solidity` supporte l'héritage de smart contract nous pouvons ainsi hériter d'un autre smart contract que l'on souhaite _spécialiser_ ou d'une `interface` que l'on souhaite implémenter.

### Compiling Solidity file

Solidity est un language que l'EVM ne comprend pas.  
Solidity est désigné pour que des développeurs n'aient pas à écrire du `bytecode` directement, c'est un langage de haut niveau, lisible par les humains.  
l'EVM ne comprend que le `bytecode`, pour cela il faut convertir les fichiers textes Solidity en `bytecode` en utilisant un compilateur.
`solc` est le compilateur officiel de Solidity: https://docs.soliditylang.org/en/latest/using-the-compiler.html  
En général on ne lance plus `solc` directement depuis la ligne de commande il est directement intégré et lancé depuis les projet `truffle` ou `hardhat`, ou `remix`.
De plus `solc` nous génère également l'`ABI` de notre smart contract, qui contient l'interface de notre smart contract. Grâce à l'ABI des programmes extérieurs, comme notre frontend React ou un script Node.js peuvent savoir comment communiquer avec notre smart contract.

## Processus for smart contracts development

### Write a solidity file.

Nous écrivons les smart contracts dans un éditeur de texte. Le fichier possédera l'extension _.sol_.

### Compilation

Le fichier texte Solidity est ensuite compilé par le compilateur `solc` qui générera le `bytecode` et l'`ABI` si aucunes erreurs est détectée.

### Extract the ABI

Le fichier contenant l'`ABI` généré par le compilateur devra être conservé pour etre partagé avec notre application frontend ou backend, pour qu'ils sachent comment communiquer avec notre smart contract.

### Deploy

Le `bytecode` généré par le compilateur sera déployé sur la Blockchain Ethereum par une transaction, il faudra un account qui possède des ethers pour payer les gas fee du déploiement.

### Ethereum development environment

Afin d'automatiser les points énumérés ci dessus il est préférable d'utiliser des environnements de développement, tel que [Hardhat](https://hardhat.org/getting-started/) et [Truffle](https://www.trufflesuite.com/docs/truffle/overview).  
Ces environnements nous permettent de faciliter le développement de nos smart contracts, d'automatiser nos tests et nos scripts de déploiement.  
Ils utilisent Node.js comme package manager.

## Solidity alternatives

Sur la Blockchain Ethereum un smart contract est une suite de `bytecode`. Nous pouvons utiliser n'importe quel langage tant qu'il possède un compilateur qui peut compiler le fichier code source en `bytecode`.  
L'alternative à Solidity la plus connue est `vyper`: https://vyper.readthedocs.io/en/stable/
