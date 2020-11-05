# Exercice ICO avec interface utilisateur en React

Le but de cet exercice est de créer une interface utilisateur pour votre ICO.
Les utilisateurs se connecteront à votre interface pour effectuer un achat de token.

Vous devrez créer 2 repo accessibless depuis github:

- 1 pour votre frontend React
- 1 pour vos smart contracts.

## smart contracts

Je vous recommande d'écrire vos smart contracts sur remix et de les tester sur remix puis ensuite de déployer les versions définitives via Truffle.
Il faudra 1 smart contract pour le token et 1 smart contract pour l'ICO, vous pouvez vous inspirer de: https://github.com/AbsoluteVirtueXI/blockchain-courses/tree/master/exercices/ethereum/correction-exercices-soutien.md

Déployer le contrat du token, et vous attribuer l'ensemble de la capacité totale des tokens
Déployer le contrat de l'ICO et configurer le prix à 1 TOKEN pour 0.1 Ether

N'oubliez pas qu'il faudra `approve` le smart contract d'ico depuis le smart contract de token.
Cela peut être difficile pour ceux qui ont déployé depuis Truffle, pour cela il faudra faudra utiliser le déploiement via "At Address" de remix, où il faudra renseigner l'adresse de déploiement que vous avez récupéré via Truffle.
(C'est l'astuce que vous avez utilisé pour récupérer les exo que j'avais caché)

## FronEnd

Setup un projet React comme vu en cours.
N'oubliez pas d'ajouter la dépendance ethers.js:

```zsh
% yarn add ethers
```

En vous inspirant du cours d'aujourd'hui, implémenter une interface intuitive pour permettre à des utilisateurs d'acheter vos tokens.
Les achats de tokens se feront par l'envoi d'ethers directement à l'adresse du smart contract de l'ICO.

https://github.com/AbsoluteVirtueXI/web3-demo-2
