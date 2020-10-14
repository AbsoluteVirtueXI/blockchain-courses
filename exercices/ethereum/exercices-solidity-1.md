# Exercices Solidity 1

Vous devez mettre tous les exercices dans 1 unique repository qui est accessible depuis github.  
Créez un nouveau repo sur github et créer le repo en local sur votre machine:
**LE PROJET CONTENANT VOS EXERCICES NE DOIT PAS ÊTRE CREE AVEC DJINIT**

## 1 SolidityCourse.sol / Logger.sol

Créez les fichiers _SolidityCourse.sol_ et _Logger.sol_ du cours de ce matin dans votre environment de travail sur `remix`. Déployez les, et utilisez les.
Décrivez avec vos propres mots les fonctionnalités du smart contracts `SolidityCourse`
**Attention lorsque vous déployez le contrat de vérifier que vous déployez bien le contrat SolidityCourse et non pas le contrat Logger**

## 2 Calc.sol

Ecrivez un smart contract `Calc` qui sera définit dans le fichier _Calc.sol_
le contrat `Calc` comportera 4 fonctions de calculs `add`, `sub`, `mul`, `div` qui prennent en paramètres 2 `uint` et qui retournera l'opération de calcule appliquée à ces 2 `uint`
Il faudra mettre les bons paramètres de visibilité sur ces fonctions, et aussi les déclarer en fonction de leur accès aux données du smart contract (`view` vs `pure` vs rien)

## 3 view vs pure

Décrivez avec vos mots la différence entre une fonction déclarée comme `pure` et une fonction déclarée comme `view`

## 4 Calc.sol

En reprenant le contrat précédent, mettez une protection avec un `require` ou un `modifier` pour que ces opérations de calculs ne puissent être effectuées que par l'adresse de celui ou celle ou qui déployé le contrat.
Vérifiez bien, en utilisant `remix` qu'une autre adresse que celle qui a deployé le smart contract n'a pas accès aux fonctions du smart contract.

## 5 Calc.sol

Rajoutez des commentaires de types `natspec` au smart contract précédent pour que l'on puisse générer une documentation technique de cette API de calcul.
voir: https://solidity.readthedocs.io/en/v0.7.0/natspec-format.html

## 6 MaxInfo.sol

Ecrivez un smart contract qui contient des fonctions qui retournent le maximum d'info sur l'utilisateur qui effectue la transaction, la transaction elle même et le bloc contenant cette transaction.
On peut imaginer des fonctions pour chacuns de ces élements ou une `struct` qui contiendrait ces informations.
Aidez vous de: https://solidity.readthedocs.io/en/latest/cheatsheet.html#global-variables
