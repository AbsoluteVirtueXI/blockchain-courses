# **Solidity**

Documentation officielle: https://solidity.readthedocs.io/en/v0.7.3/

Lorsque vous consultez une documentation, vérifiez bien le numéro de version auquel s'applique cette documentation.

## **Introduction**

Solidity est un langage orienté objet de haut niveau à typage fort.
Typage fort signifie que le type de toutes nos variables, ainsi que les paramètres de nos fonctions et leur valeur de retour doivent avoir un type définit dés la compilation (typage fort statique), ou pour certains avant leur exécution (typage for dynamique).

> Solidity is statically typed, supports inheritance, libraries and complex user-defined types among other features.

Solidty est un langage dont la syntaxe se rapproche fortement du C++, java ou encore Javascript. On peut le décrire comme un langage C-Like.

> Solidity was influenced by C++, Python and JavaScript and is designed to target the Ethereum Virtual Machine (EVM).

Solidity est l'un des langages qui permet de developper et d'implémenter des smart contracts.
Les fichiers code source en Solidity doivent être compilés en `bytecode` puis ce `bytecode` sera ensuite déployé sur l'`EVM` puis exécuté lors d'une interaction avec ce smart contracts.
Solidity est un petit langage, qui n'a été prévu que pour écrire des smart contracts, il a été spécifiquement désigné pour cela, ce n'est pas un **General-purpose programming languages**

## **Structure d'un fichier Solidity**

Par convention, l'extension d'un fichier Solidity est `.sol`.  
Un fichier Solidity se compose d'un certain nombre de définitions de `contract`s, `library`, d'`import`, de directives `pragma` de `struct`, d'`enum`, de `function` et de variables `constant`.

_SolidityCourse.sol_:

```solidity
// SPDX-License-Identifier: MIT                 // SPDX Licence Identifier
pragma solidity ^0.6.0;                         // Version pragma
pragma experimental ABIEncoderV2;               // Experimental pragma
contract SolidityCourse {

}
```

_DummyLib.sol_:

```solidity

```

### **`SPDX Licence Identifier`**

Une véritable confiance en votre smart contract peut s'établir avec vos utilisateurs que si vous fournissez le code source de votre smart contract.
(Il faut notez que le `bytecode` de votre smart contract sera toujours visible dans l'`EVM`, et pas nécessairement le code source Solidity de votre smart contract).
Publier son code Solidity peut entraîner des problèmes de copyright, il faut donc spécifier une licence qui sera incluses dans les meta-données de votre `bytecode`.  
Liste des licences disponibles: https://spdx.org/licenses/
Si vous ne souhaitez pas inclure une licence il faudra tout de même spécifier l'identifier `SPDX-License-Identifier: MIT `

### **Généralités sur la directive `pragma`**

La directive `pragma` est ce qu'on appelle une directive du préprocesseur.
Cette directive assure une phase préliminaire de la compilation.  
C'est un procédé qui est inspiré des langages `C` et `C++`.  
Son objectif est de renseigner le compilateur avant la phase de compilation sur son comportement, des vérifications à effectuer ou des fonctionnalités à activer.
Actuellement pour Solidity les directives `pragma` servent à spécifier une ou des versions de compilateurs acceptables pour notre code source et d'activer des fonctionnalités expérimentales.

### **Version `pragma`**

Cette directive `pragma` spécifie la ou les versions acceptables pour notre code source Solidity.

```solidity
// Ne compilera pas avec une version de compilateur antérieure à 0.6.0
// et ne compilera pas à partir de 0.7.0
pragma solidity ^0.6.0;
```

```solidity
// Compilera seulement avec une version de compilateur entre 0.6.0
// et 0.8.0 (non incluse)
pragma solidity >= 0.6.0 < 0.8.0;
```

### **Experimental `pragma`**

Cette directive `pragma` spécifie les features expérimentales à activer lors de la compilation qui ne sont pas encore activées par défaut.  
Il existe actuellement 2 features expérimentales sur Solidity:

```solidity
// Offre la possibilité d'encoder et decoder des structures de données complexes.
// Cette fonctionnalité est très utile, et vous devrez probablement l'activer.
// Depuis 0.6.0 cette feature n'est plus considérée comme experimentale en réalité.
pragma experimental ABIEncoderV2;
```

et

```solidity
// Permet d'obtenir des informations complémentaires sur des bugs, erreurs et
// problèmes liées à la sécurité pendant la compilation.
// Cette feature est vraiment expérimentale, il est préférable de la désactiver.
pragma experimental SMTChecker;
```

## **Types de données**

## **Structures de contrôle**

## **Precedence of operators**

## **Variables globales**
