# Game: King of the Hill

Le roi de la colline (ou roi de la montage) est un jeu ou un joueur doit demeurer au sommet d'une colline contre les efforts des adversaires qui essayent de le détrôner.  
Dans un cet exercice vous devrez implémenter ce jeu sur la Blockchain Ethereum avec un smart contract.  
Une fois déployé ce jeu fonctionnera indéfiniment de manière décentralisé.

## Format du rendu

Vous devrez rendre votre smart contract dans un repository `king-of-the-hill` accessible sur github en renseignant dans ce formulaire: https://forms.gle/ea8teWa8fJxNPgid6

- l'url de votre repository
- le nom du testnet sur lequel le smart contract est déployé
- l'adresse du smart contract déployé

## Règles

Les joueurs doivent acquérir le contenu d'un pot qui contient de l'ether, en envoyant le double de ce que contient le pot au moment de la transaction.  
Le joueur qui envoi le double du pot actuel devient le pot owner.  
Si le pot owner arrive à rester l'owner de ce pot pendant un certain nombre de blocs alors il gagne 80% du pot.  
10% sont envoyés à l'owner du smart contract.  
10% sont laissés dans le pot comme `seed` du prochain tour.

## Edge cases

Il y a 2 cas particuliers, le déploiement et une fin de tour.
Au déploiement l'owner du smart contract doit aussi envoyer une certaine somme pour que le jeu puisse commencer et que le pot contienne déjà un enjeu en ether (Oui un `constrcutor` peut être payable).  
Si un joueur reste l'owner du pot durant le nombre de blocs nécessaires pour gagner et qu'un nouveau joueur essaye d'acquérir ce pot alors un nouveau tour de jeu est lancé.  
Lancer un nouveau tour de jeu consiste à:

- Envoyer 80% du pot à l'owner du pot
- Envoyer 10% du pot à l'owner du smart contract
- Laisser 10% du pot comme seed pour ce nouveau tour
- Le joueur ne déposera donc que le double des 10% du seed, il deviendra le nouveau pot owner
- Le reste de la somme envoyée par le nouveau joueur pour setup un nouveau tour de jeu est restituée à ce joueur

## Natspec

Utiliser des commentaires natspec comme vu en cours et dans la documentation.
