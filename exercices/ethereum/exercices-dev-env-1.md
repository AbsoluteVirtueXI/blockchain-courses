# Exercices development environment

## Hardhat project: Calculator

Ce projet Hardhat devra être pushé sur un repository accessible depuis github.  
Ce repository devra se nommer `Hardhat-Calculator`.  
Vous devrez fournir le lien de votre repo github dans le formulaire de rendus d'exercices suivant https://forms.gle/Ks8DYYR1LqQ6UD8S7  
Suivez les instructions du cours pour setup un projet `Hardhat`.  
Essayez de partir sur un version vide d'un projet Hardhat et de reconstruire à la main votre projet, en vous inspirant de l'exemple biensur.  
Après le setup de votre projet vide il faudra installer manuellement des dépendances:

```zsh
yarn add @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers ethers --dev
```

### Calculator.sol

Ce projet devra contenir un fichier Solidity `Calculator.sol` qui contiendra un smart contract `Calculator`.  
Ce smart contract `Calculator` nous retournera le résultat des opérations arithmétiques communes.  
Les fonctions pour obtenir ces résultats devront toutes être `pure view`.

### Calculator-test.js

En vous inspirant des cours et de la vidéo recommandée essayez d'écrire des tests unitaires des fonctions de votre smart contract `Calculator` afin de vérifier qu'il fonctionne correctement.

### deploy-Calculator.js

En vous inspirant des cours et de la vidéo recommandée essayez d'écrire un script de déploiement de votre smart contract `Calculator`.

### Calculator-abi.json

Extraire l'ABI de votre smart contract que vous trouverez dans l'artificat associé au smart contract et la copier dans un fichier _Calculator-abi.json_ dans un dossier `abi` qui sera à la racine de votre repo.

## Be a real Solidity Dev

exo non obligatoire que vous pouvez push mais pas à rendre via le formulaire

En récupérant les corrections des exo `Testament.sol` et `Birthday.sol` créer un projet Hardhat pour chacun d'eux.  
C'est tout :).
Essayez néanmoins d'écrire les scripts de déploiements pour chacun d'eux.
Sans obligatoirement les écrire réfléchissez à certains tests unitaires qu'il faudra que l'on ecrive absolument.
Nous les écrirons ensemble lors de sessions de live coding. Mais au moins les projets HardHat seront prêt.

## Challenge: Token

La vidéo recommandée du cours commence l'écriture d'un token ERC20.  
Ce token n'est pas entièrement implémenté pour respecter la norme EIP20 qui définit un ERC20.  
En vous inspirant du `SmarWallet` du cours, ainsi que de l'EIP20 et du code d'OpenZepplin qui implémente un ERC20, essayez de rajouter les fonctionnalités qui manquent, tel que la gestion des allowance, le `transferForm` etc...  
Evidement, essayez d'écrire les tests unitaires des nouvelles fonctionnalités implémentés.

EIP20: https://eips.ethereum.org/EIPS/eip-20
ERC20: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol
