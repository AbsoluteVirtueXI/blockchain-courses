# Exercices de soutien solidity

Vous devez mettre tous les fichiers de solidity dans 1 unique repository qui est accessible depuis github.  
Créez un nouveau repo sur github et créer le repo en local sur votre machine:
**LE PROJET CONTENANT VOS EXERCICES NE DOIT PAS ÊTRE CREE AVEC DJINIT**

**Pour tous les exercices suivants vous devrez spécifier les bonnes visibilités et modifier les plus pertinents en fonction du contexte.**  
**Lorsqu'il faudra fournir l'adresse d'un contrat déployé ce sera indiqué dans l'énoncé de l'exercice.**

## 0 _TheOne.sol_

Ecrivez un contrat `TheOne`.
Ce contrat devra posséder une fonction `one` qui retournera le nombre 1 lorsqu'elle sera appelée.

## 1 _HelloWorld.sol_

Ecrivez un contrat `HelloWorld`.  
Ce contrat devra posséder une fonction `hello` qui retournera la string "Hello world!" lorsqu'elle sera appelée.

## 2 _SimpleStorage.sol_

Ecrivez un contrat `SimpleStorage` qui modifiera/affichera le contenu d'une variable `uint256 private storedData`.  
Une fonction `get()` retournera la valeur de `storedData`;
Une fonction `set(uint256 value)` modifiera la valeur de `storedData` par `value` passé en paramètre. '

## 3 _CheckOdd.sol_

Ecrivez un contrat `CheckOdd`.
Ce contrat devra posséder une fonction `check` qui prendra en paramètre un `uint` et qui retournera `true` si le nombre passé en paramètre à `check`est impair sinon elle retournera false.

## 4 _mapToMap.sol_

Ecrivez un contrat `mapToMap`.
Ce contrat possédera une variable d'état `earth` `public` qui sera un mapping de `string` (des continents) vers un mapping de `string` (des pays de ce continent) vers une `string` (la capitale de ce pays);
Renseigner directement dans le constructeur certaines valeurs comme:

```solidity
earth["europe"]["france"] = "paris";
earth["amerique du sud"]["argentine"] = "buenos aires"
```

Ainsi pour récupérer la capitale de la France nous pourrions directement y avoir accès via remix en passant "europe" et "france" en paramètres.

## 5 _Contact.sol_

Ecrivez un contrat `Contact` qui permettra d'enregistrer ou de récupérer des info sur un contact en fonction de son adresse Ethereum.
Les informations pour chaque contact seront stockées dans une `struct` avec les champs suivants: `string name`, `string email`, `string phone`.  
Un mapping nous donnera la correspondance entre 1 adresse Ethereum et ces informations.  
Une fonction `addContact` nous permettra d'ajouter un nouveau contact avec l'adresse Ethereum, le nom, l'email et le téléphone du contact en arguments à cette fonction.  
Une fonction `getContact(address _addr)` nous permettra de récupérer les informations d'un contact en fonction d'une addresse Ethereum.
Pour que la fonction `getContact(address _addr)` fonctionne il faudra ajouter `pragma experimental ABIEncoderV2;` comme directive de pragma.

## 6 _FirstErc20.sol_

Lisez entièrement l'exercice avant de commencer.

Déployez le contrat FirstErc20 comme il a été développé dans:  
https://github.com/AbsoluteVirtueXI/blockchain-courses/blob/master/exercices/ethereum/correction-exercices-smart-contracts/FirstErc20.sol

Votre ERC-20 devra avoir un nom, un symbole, `decimals` devra être de 18 et le maximum de tokens qui pourront être créés sera de 1 millards.

1. Au déploiement de ce contrat allouez vous 1 millions de tokens via la constructor.
2. Par une opération de `mint` créer 1000 tokens pour le compte `0x57D401B8502bC5CBBaAfD2564236dE4571165051`.
3. Par une opération de `transfer` (via remix ou metamask) envoyer à `0x57D401B8502bC5CBBaAfD2564236dE4571165051` 500 tokens.
4. Par une opération d'`approve` autoriser `0x57D401B8502bC5CBBaAfD2564236dE4571165051` à déplacer un maximum de 500 000 tokens en votre nom.

Pour justifier de la réussite de l'exercice vous devrez fournir:

- L'adresse du contrat déployé
- un lien vers etherscan qui contiendra les détails de la transaction de `mint`
- un lien vers etherscan qui contiendra les détails de la transaction de `transfer`
- un lien vers etherscan qui contiendra les détails de la transaction de `approve`

## 7 _Adder.sol_

Ecrivez un contrat `Adder`.  
Ce contrat devra posséder une fonction `add(uint256 nb1, uint256 nb2)` qui retournera la somme des 2 arguments passés à la fonction.

## 8 _Suber.sol_

Même principe mais pour une soustraction.

## 9 _Multiplier.sol_

Même principe mais pour une multiplication.

## 10 _Divisor.sol_

Même principe mais pour une division.

## 11 _Calculator.sol_

Créer un contrat `Calculator`.  
Ce contrat devra posséder 4 fonctions: `add`, `sub`, `mul`, `div`.  
Ces 4 fonctions prennent chacune en paramètres 2 `uint`.  
Ces fonctions devront effectuer l'opération de calcul correspondante par les contrats déployés précédemment et retourner la valeur de l'opération. Par exemple la fonction `add` du contrat `Calculator` devra appeler la fonction `add` du contrat `Adder` déployé précédemment.
Il faudra penser à importer le code/interface des différents contrats des exercices précédents dans _Calculator.sol_ afin que l'interface de chacun des contrats soient connues par le contrat `Calculator` et déclarer les contrats `Adder`, `Suber`, `Multiplier`, `Divisor` dans notre contrat `Calculator`.
Par exemple pour déclarer le contrat `Adder` dans _Calculator.sol_:  
`Adder adderContract = Adder(ADRESSE_ETHEREUM_DE_ADDER);`

## 12 _CalcToken.sol_

Déployer un token CalcToken qui possédera le même code que:
https://github.com/AbsoluteVirtueXI/blockchain-courses/blob/master/exercices/ethereum/correction-exercices-smart-contracts/FirstErc20.sol  
Le nom du token sera `CalcToken`, le symbole `CALK`, `decimals` de 18 et le cap de 1 millions.
Attribuez vous un nombre assez conséquent de token `CALK` lors du déploiement afin que vous puissiez les vendre lors d'une future ICO.  
Fournir également l'adresse de ce contrat.

## 13 _CALKIco.sol_

Réaliser un contrat d'ICO, `CALKIco` pour vendre vos propres tokens CALK.
1 CALK sera vendu pour 0.1 ether.  
Déployer ce contrat.

## 14 _Calculator.sol_

Lisez entièrement l'exercice avant de commencer.

Rentabiliser le contrat `Calculator`, toutes les opérations de calculs, cad l'appel des fonctions `add`, `sub`, `mul`, `div` du contrat `Calculator`, couteront désormais 0.01 CALK.  
Pour cela il faudra que l'utilisateur `approve` l'adresse du contrat `Calculator` dans `CalcToken`.
Ainsi lors d'une opération de calcul un `transferFrom` sera effectué par le contrat `Calculator` de 0.01 CALK de la balance de l'utilisateur vers la balance du contrat `Calculator` (et non pas celle du bénéficiaire, car oui! un contrat peut aussi posséder des tokens).
Pour info un contrat peut récupérer sa propre adresse avec `address(this)`;
Il faudra ajouter une fonction `withdraw` qui fera un `transfer` des tokens que possèdent le contrat vers un bénéficiaire.
Le bénéficiaire sera le seul à pouvoir appeler cette fonction `withdraw`.  
Il faudra créer un bénéficiaire qui sera le seul à pouvoir `withdraw` les tokens et ainsi les recevoir.

## 15 Faille

Lisez entièrement l'exercice avant de commencer.

Il y a une faille dans notre architecture. Des utilisateurs peuvent toujours effectuer des opérations de calculs en appelant directement les contrats `Adder`, `Suber`, `Multiplier` et `Divisor`
Pour chacun des contrats ci dessus ajouter un modifier `onlyAddress` qui n'autorisera que l'adresse de `Calculator` à les appeler.  
L'adresse de `Calculator` sera renseigné par une fonction `setCalculatorAddress` qui ne sera exécuté que par un admin.  
L'ordre des déploiements et opérations sera:

1. Déployer `Adder`
2. Déployer `Suber`
3. Déployer `Multiplier`
4. Déployer `Diviser`
5. Déployer `Calculator` avec les adresses connues des précédents contrats déployés.
6. Récupérer l'adresse de `Calculator`
7. Exécuter `setCalculatorAddress` avec l'adresse de `Calculator` connue sur chacun des contrats `Adder`, `Suber`, `Multiplier`, `Diviser`.
8. Déployer le contrat d'ICO `CALKIco`

Fournir les adresses des contrats `Adder`, `Suber`, `Multiplier`, `Diviser`, `Calculator`, `CALKIco`.
