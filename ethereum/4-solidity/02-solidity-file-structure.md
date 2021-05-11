# Solidity file structure

Par convention, l'extension d'un fichier Solidity est `.sol`.  
Un fichier Solidity se compose d'un certain nombres d'éléments.
Au top level d'un fichier Solidity on peut retrouver:

- SPDX-License-Identifier
- directives de `pragma`
- directives d'`import`
- définitions de `contract`
- définition d'`interface`
- définitions de `library`
- définitions de `function`
- définitions de variables `constant`
- définitions de `struct`
- définitions d'`enum`
- définitions d'`error`

https://docs.soliditylang.org/en/latest/grammar.html#a4.SolidityParser.sourceUnit

## SPDX Licence Identifier

Une véritable confiance en votre smart contract peut s'établir avec vos utilisateurs que si vous fournissez le code source de votre smart contract.  
(Il faut notez que le `bytecode` de votre smart contract sera toujours visible dans l'`EVM`, mais pas le code source Solidity de votre smart contract).  
Publier son code Solidity peut entraîner des problèmes de copyright, il faut donc spécifier une licence qui sera incluses dans les meta-données de votre `bytecode`.  
Liste des licences disponibles: https://spdx.org/licenses/
Si vous ne souhaitez pas inclure une licence il faudra tout de même spécifier l'identifier:  
`// SPDX-License-Identifier: MIT`.

le SPDX Licence Identifier devra toujours être la 1ere ligne de votre fichier Solidity et sera un commentaire.

## pragma

La directive `pragma` est ce qu'on appelle une directive du préprocesseur.
Cette directive assure une phase préliminaire de la compilation.  
C'est un procédé qui est inspiré des langages `C` et `C++`.  
Son objectif est de renseigner le compilateur avant la phase de compilation sur son comportement, des vérifications à effectuer ou des fonctionnalités à activer.
Actuellement pour Solidity les directives `pragma` servent à spécifier une ou des versions de compilateurs acceptables pour notre code source et d'activer des fonctionnalités expérimentales.
Depuis solidity `0.8.0` les fonctionnalités expérimentales sont activées par défaut car elles ne sont plus considérée comme expérimentales. la directive `pragma` ne sert donc plus qu'a spécifier la version du compilateur.

### Version `pragma`

Cette directive `pragma` spécifie la ou les versions du compilateur autorisé à compiler notre code source Solidity.

```solidity
// Ne compilera pas avec une version de compilateur antérieure à 0.8.0
// et ne compilera pas à partir de 0.9.0
pragma solidity ^0.8.0;
```

```solidity
// Compilera seulement avec une version de compilateur entre 0.7.0
// et 0.9.0 (non incluse)
pragma solidity >= 0.7.0 < 0.9.0;
```

### Experimental `pragma`

Cette directive `pragma` spécifie les features expérimentales à activer lors de la compilation qui ne sont pas encore activées par défaut.  
Il existe actuellement 2 features expérimentales sur Solidity qu'il n'est plus recommandé d'utiliser depuis `0.8.0`.
Pour plus d'information:
https://docs.soliditylang.org/en/latest/layout-of-source-files.html?highlight=pragma%20#abi-coder-pragma
https://docs.soliditylang.org/en/latest/layout-of-source-files.html?highlight=pragma%20#experimental-pragma
https://docs.soliditylang.org/en/latest/080-breaking-changes.html#silent-changes-of-the-semantics

## import

Solidity utilise la même syntaxe d'`import` que l'on a utilisé en JavaScript ES6.
Le chemin d'accès du fichier à importer est important. Tous les noms de fichiers importés sont considérés comme des chemins absolus. Si nous souhaitons importer un fichier qui est dans le répertoire courant nous devons ajouter `./` devant le nom du fichier.  
Il existe des options que nous pouvons passer au compilateur afin de déterminer le répertoire de base des `import`.

```solidity
// Importe tout le contenu de ./DummyLib.sol dans le fichier courrant
import "./DummyLib.sol";
```

L'`import` précédent peut créer une collision de noms, cad que des noms importés existe déjà dans le fichier courant.
Pour éviter cela on peut créer des alias:

```solidity
// Importe DummyContract en tant que Dummy depuis ./DummyLib.sol
import {DummyContract as Dummy} from "./DummyLib.sol";
```

Une autre façon de faire:

```solidity
// Importe tout le contenu de ./DummyLib.sol et le rend accessible
// via le nom Dummy
import * as  Dummy from "./DummyLib.sol";
```

Une alternative à la syntaxe précédente est:

```solidity
// Importe tout le contenu de ./DummyLib.sol et le rend accessible
// via le symbole dummyLib
import "./DummyLib.sol" as Dummy;
```

https://docs.soliditylang.org/en/latest/grammar.html#a4.SolidityParser.importDirective

## Les commentaires

Les commentaires standards ne sont pas interprété par le compilateur.  
On peut en mettre partout.

Comme en JavaScript:

```solidity
// Commentaire sur une ligne.

/*
    Commentaire sur
    plusieures lignes.
*/
```

Il existe un autre type de commentaire qui en plus de servir à documenter le code,
sert également à générer la documentation technique du code automatiquement.
Ce sont les commentaires `natspec`:

```solidity
pragma solidity ^0.8.0;

/** @title Shape calculator. */
contract ShapeCalculator {
    /** @dev Calculates a rectangle's surface and perimeter.
      * @param w Width of the rectangle.
      * @param h Height of the rectangle.
      * @return s The calculated surface.
      * @return p The calculated perimeter.
      */
    function rectangle(uint256 w, uint256 h) public pure returns (uint256, uint256) {
        uint256 s = w * h;
        uint256 p = 2 * (w + h);
        return (s, p);
    }
}
```

https://docs.soliditylang.org/en/latest/natspec-format.html?highlight=Natspec

## Déclaration d'un contrat

Un contract est l'équivalent d'une classe d'un langage orienté objet.
Un contract se déclare de la manière suivante:

```solidity
contract MyContract {
    // Déclarations goes here...
}
```

le mot clé `contract` suivit du nom du contract et entre les 2 accolades le contenu du contract.
Un contract peut contenir les déclarations suivantes:

- un `constructor`
- des déclarations de `struct`
- des déclarations d'`enum`
- des variables d'états
- des `function`
- des `modifier`
- des `event`

## Order of layout in a Solidity file

Comme précisé dans le [style guide](https://docs.soliditylang.org/en/latest/style-guide.html#order-of-layout) l'ordre des déclarations suit une convention.
Une convention sur l'ordre des déclarations aide les lecteurs à identifier les composants de nos fichiers plus facilement.
Il faudra déclarer dans l'ordre suivant les différents composants de notre fichiers Solidity:

1. SPDX Licence Identifier
2. Pragma statements
3. Import statements
4. Interfaces
5. Libraries
6. Contracts
