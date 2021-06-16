# Exercice Faucet + ERC20 interface

Cet exercice est évalué et est à rendre avant le vendredi 18 juin 17h30 au plus tard.

Cet exercice comprend la création d'un token ERC20, d'un smart contract de Faucet et d'une interface qui permettra de récupérer des tokens de tests et de pouvoir utiliser les fonctionnalités de base d'un ERC20.

Votre project React et votre projet Hardhat devront être accessible depuis un repository github.  
Le formulaire de rendu: https://forms.gle/z8D3rFEXy9g6eV4D7

## Smart contracts dans un projet hardat

Votre projet devra contenir un smart contract de token ERC20 classique, ainsi qu'un smart contract pour un faucet décentralisé.
Ce faucet permet l'envoi d'une quantité fixe de tokens possédés par une adresse qui est sous votre contrôle.  
Pour l'exercice je vous recommande de créer une nouvelle adresse et de partager la clef privée entre les membres de ce projet.
Cet adresse peut aussi être l'adresse qui reçoit tous les tokens mintés au déploiement du token ERC20.  
Le smart contract Faucet effectuera un contrôle avant d'envoyer les tokens, la même adresse ne pourra effectuer une demande de tokens que tous les 3 jours.  
Une opération post déploiement pour l'approve du smart contract de Faucet par l'owner des tokens à transférer est nécéssaire, elle peut se faire manuellement via une interface (remix ou la votre) ou automatisé (préférable) dans vos scripts hardhat (plus d'informations sur cette méthode seront fournies sur discord).  
N'oubliez pas les tests unitaires!!

## interface utilisateurs dans un projet React

Une interface web permettra à vos utilisateurs de:

1. Demander des tokens de test
2. utiliser les fonctionnalités de base de votre ERC20

Cette application devra être réactive aux events émis par vos smart contract!!.
Elle pourra aussi afficher des informations importantes pour vos utilisateurs comme sa balance actuelle de tokens.  
Des inputs seront nécessaires, il faudra vérifier leur validité autant que possible coté React avant de les envoyer vers la Blockchain.  
Par exemple pour vérifier qu'une adresse entrée est correcte vous pouvez utiliser: https://docs.ethers.io/v5/api/utils/address/#utils-isAddress
