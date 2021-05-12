# Exercices Solidity et Ethereum partie 2

Vous devrez fournir le lien du repository exerices-solidity-ethereum-2 pour compléter ces exercices via le formulaire: https://forms.gle/Ks8DYYR1LqQ6UD8S7

## Birthday.sol

Ecrivez un smart contract `Birthday` qui permettra à une adresse de retirer tous les fonds du smart contract à partir d'une certaine date.  
Les fonds pourront être envoyés par ses amis via une fonction `offer` ou bien directement depuis une transaction via metamask. Il faudra donc implémenter la fonction `receive`.  
Une fonction `getPresent` permettra de récupérer tous les ethers envoyés au smart contract et ne sera débloquée que pour une adresse précise et à une date précise (un timestamp).  
Dans le constructor vous devrez obligatoirement y indiquer l'adresse de la personne dont ce sera l'anniversaire et aussi un nombre qui correspondra à un nombre de jours qui sera le délai entre l'anniversaire et la date déploiement du smart contract.  
Il faudra vous servir de `block.timestamp`: https://docs.soliditylang.org/en/latest/units-and-global-variables.html#time-units  
Attention le timestamp d'un block est exprimé en `seconds`.  
Déterminer la date d'anniversaire au jour près, on ne pas se fier à des dates précises (à la seconde) dans une blockchain.
C'est un exercice ouvert, essayez d'être le plus cohérent avec la problématique à résoudre.  
Il peut exister plusieurs solutions.

## Testament.sol

Ecrivez un smart contract `Testament` qui permettra de léguer à des bénéficiaires des Ethers à la mort de l'owner du smart contract.
L'owner devra déposer les fonds qu'il souhaite léguer à des bénéficiaires, un à un via une fonction `bequeath(address account, uint256 amount) public payable`.  
L'owner devra désigné un médecin, et qui pourra aussi être changé par l'owner tant qu'il vit, pour certifier de la mort de l'owner.
A la mort de l'owner, lorsque le médecin certifie sa mort sur le smart contract, les bénéficiaires de l'héritage peuvent retirer les fonds qui leurs sont attribués. (Un bénéficiaire devra lui même récupérer ses fonds en appelant une fonction du smart contract).  
C'est un exercice ouvert, essayez d'être le plus cohérent avec la problématique à résoudre.  
Il peut exister plusieurs solutions.
