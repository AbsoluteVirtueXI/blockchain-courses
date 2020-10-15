# Exercices Solidity 2

Vous devez mettre tous les exercices dans 1 unique repository qui est accessible depuis github.  
Créez un nouveau repo sur github et créer le repo en local sur votre machine:
**LE PROJET CONTENANT VOS EXERCICES NE DOIT PAS ÊTRE CREE AVEC DJINIT**

**Fournir l'adresse Ethereum de votre contrat final `FirstToken`**

## 1

Décrivez comment vous êtes arrivé jusque là

## 2 _FirstToken.sol_

_FirstToken.sol_: https://github.com/AbsoluteVirtueXI/alyra-courses/blob/master/ethereum/3-smart-contract-programming.md  
Déployez le contrat _FirstToken.sol_ et passez en paramètre du `constructor` une adresse dont vous avez le contrôle avant le déploiement.  
Ainsi les Ethers récoltés seront bien envoyés à une adresse dont vous êtes propriétaires.
Effectuez 1 transaction depuis un second compte pour vérifier que votre contract fonctionne comme convenu.

## 3 _FirstToken.sol_

Une étude approfondie nous montre que notre token devrait couter `1 Ether`.  
Améliorez la fonction `buyToken()` afin que chaque token puisse être vendu pour `1 Ether`.  
Pour simplifier l'exercice nous supposerons que l'utilisateur qui souhaitera acheter notre token enverra forcement un nombre entier d'`Ether`, par exemple 0, 1, 2,...10 `Ethers`.  
Attention à l'unité de mesure, dans Ethereum tout est calculé en `wei`.  
(indice: Solidity nous offre une possibilité pour faire des conversions facilement entre les différentes dénominations: `wei`, `gwei`, ... , `ether`).

## 4 _FirstToken.sol_

Je suis votre formateur, et j'aimerais obtenir de vous un discount sur le prix de votre token.  
Modifier `buyToken()` afin que je puisse obtenir 10 fois le nombre de token pour le prix standard. C'est à dire que si je vous envoi `1 Ether` je puisse recevoir 10 tokens, et 20 tokens si je vous envoi `2 Ether`.  
Mon adresse Ethereum est: `0x57D401B8502bC5CBBaAfD2564236dE4571165051`

## 5 _FirstToken.sol_

Lors d'une ICO, les premiers acheteurs sont toujours des privilégiés.  
Retravaillez l'exercice précédent afin que ceux qui puissent obtenir 10 fois le nombre de tokens pour le prix standard soient enregistrés dans un `mapping` tel que:  
`mapping(address => bool) public investors;`  
Ecrivez une fonction `setInvestor(address _investor)` qui ne pourra être exécutée que par le owner du contrat.  
Depuis cette fonction on pourra ajouter des acheteurs privilégiés, en associant à l'adresse Ethereum de cet acheteur une valeur `true`.  
La fonction `buyToken()` devra prendre en compte ce `mapping` afin de vérifier si l'acheteur est privilégié.  
Si c'est le cas ils obtiendront 10 fois le nombre de token pour le prix standard, sinon appliquez les prix standard de 1 token pour 1 `ether`.

## 6 CryptoZombie

Commencez les exercices sur https://cryptozombies.io/en/course/.  
Essayez d'aller le plus loin possible.
Les exercices/cours sont aussi disponible en Français!! (peut être pas tous)
