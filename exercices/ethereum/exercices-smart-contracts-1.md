# Exercices Smart contracts programming 1

Vous devez mettre tous les exercices dans 1 unique repository qui est accessible depuis github.  
Créez un nouveau repo sur github et créer le repo en local sur votre machine:  
**LE PROJET CONTENANT VOS EXERCICES NE DOIT PAS ÊTRE CREE AVEC DJINIT**

Les exercices suivant sont une amélioration des exemples du cours.

## 1 FirstErc20.sol

Ajouter une fonction `cap()`qui retournera le maximum de tokens qui pourront être créés.

## 2 FirstErc20.sol

Ajouter une fonction `burn` qui prend en paramètre une addresse et une quantité de tokens, et qui détruira cette quantité de tokens reduisant ainsi le nombre de tokens en circulation.
Cette fonction ne pourra être appelée que par l'owner du smart contract.

## 3 FirstErc20.sol

Afin d'ajouter de la gouvernance, créer un `mapping(address => bool) admins;`
Ce mapping contiendra tous les administrateurs du smart contracts. Leur adresse sera mappée à `true` dans le mapping.

Désormais les fonctions de `mint` et `burn` ne pourront être appelées que par un admin.  
Ajouter une fonction `addAdmin(address _account)` et `delAdmin(address _account)` qui ne pourront être appelées que par un administrateur.  
Ces fonctions permettront d'ajouter ou d'enlever un admin du mapping.

Au déploiement du contrat, il faudra absolument définir l'adresse qui déploie le smart contrat comme un admin.

Il faudra remplacer le modifier `onlyOwner` par `onlyAdmin`.

## 4 _FirstIco.sol_

Ajouter la fonction `receive` qui transférera au sender
le nombre de token en fonction du nombre d'ethers envoyés.
Les ethers seront toujours transférés à l'adresse de l'owner qui a déployé le contrat.
Les tokens seront toujours transférés depuis `_seller` vers l'acheteur.
Il faudra donc que l'adresse du `_seller` `approve` l'adresse du smart contract `FirstIco`.

## 5 _TransactionCounter.sol_

Créer un smart contract `TransactionCounter` qui possédera cette interface:

```solidity
// Increments the counter by 1, and return the new counter value
function tick() public returns(uint256);

// Returns the current value of the counter:
function getCount() public view returns(uint256);
```

## 6 _TransactionCounter.sol_

Ajouter un système de contrôle afin que uniquement certaines adresses puissent exécuter la fonction `tick`. Il faudra utiliser un mapping contenant les adresses autorisées ainsi qu'un `modifier`.
Il faudra ajouter une fonction `addTicker(address _ticker)`et `delTicker(address _ticker)` afin d'ajouter/retirer des adresses autorisées à appeler la fonction `tick`.  
Ces 2 fonctions `addTicker` et `delTicker` ne pourront être exécutées par que un admin, qui sera l'owner du smart contract, qui aura été définit lors de déploiement du smart contract `TransactionCounter`
2 systèmes de contrôle sont attendus: 1 pour appeler la fonction `tick` parmi une liste d'adresses autorisées et un autre pour exécuter `addTicker` et `delTicker` qui ne pourront être exécutées que par le owner du smart contract _TransactionCounter_.

## 7 **FirstErc20.sol**

Modifier le contrat `FirstErc20` en tenant compte des modifications à ajouter ci dessous:  
Ajouter un appel à la fonction `tick()` du smart contract déployé `TransactionCounter`, a chaque fois que les fonctions `mint`, `burn`, `transfer` et `transferFrom` sont appelées depuis `FirstErc20`.  
Créer également une fonction `transactionCount()`qui retournera le nombre de transactions effectuées au total, cette fonction appellera la fonction `getCount` du smart contract `Counter`. Cette valeur contiendra donc le nombre de fois que `mint`, `burn`, `transfer` et `transferFrom` ont été appelées.  
Il faudra donc ajouter notre smart contract `FirstErc20` dans les adresses autorisées à effectuer un appel à la fonction `tick` de `TransactionCounter`.
