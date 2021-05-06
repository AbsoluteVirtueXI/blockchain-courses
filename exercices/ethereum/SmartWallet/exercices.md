# SmartWallet

## exercice 1

L'exercice 1 est indiqué dans les commentaires de SmartWallet.sol

## exercice 2

L'exercice 2 est indiqué dans les commentaires de SmartWallet.sol

## exercice 3

Tout travail mérite salaire.
L'owner du smart contract récupérera désormais un pourcentage lorsque des utilisateurs veulent récupérer leurs fonds au moment du call de `withdraw` et `withdrawAmount`.  
Ajouter un owner au smart contract qui sera défini au moment du déploiement (donc dans le constructeur).  
Un pourcentage, (un simple chiffre), sera également passé au constructeur.  
L'owner recevra (écriture comptable), ce pourcentage des fonds qui ont été récupérés. L'owner pourra récupérer ses gains quand il le souhaite en faisant appelle à la fonction `withdraw` ou `withdrawAmount`.  
Donc un utilisateur récupérera ses fonds moins le pourcentage de l'owner.
N'hesitez pas à utiliser des variables temporaires pour trouver les différents montants, et si vous devez effectuer une division (pour le produit en croix par exemple), toujours effectuer cette division en dernière opération (pour éviter une perte, car pas de chiffre à virgule dans Ethereum).
En effet `10 / 6 * 3` est différent de `10 * 3 / 6`
N'oubliez pas d'ajouter un getter (une fonction `view`) pour récupérer le pourcentage actuel qui est défini dans le smart contract.

## exercice 4

Ajouter une fonction `setPercentage` que seul l'owner du smart contract peut appeler pour changer le pourcentage ponctionné sur les fonds qui sont récupérés par les utilisateurs.

## exercice 5

Ajouter une variable d'état privée `_gain` et son getter associé `gain()` pour garder une trace des revenus générés par la ponction d'un pourcentage depuis la création du smart contract.
