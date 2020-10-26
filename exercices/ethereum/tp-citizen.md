# **TP CITIZEN**

Vous devrez créer une suite de smart contracts qui géreront un état et ses citoyens

## **le token `CITIZEN`**

Un token le `CITIZEN`, symbole `CTZ`, servira de monnaie et de point de citoyenneté dans cet état.  
100 `CITIZEN` sont automatiquement attribués à qui souhaite devenir citoyen.
Lorsqu'un citoyen ne possède plus de `CITIZEN` il ne peut plus voter.
L'entité qui sera l'état, (l'addresse d'un smart contract), devra posséder 50% du `cap` de `CITIZEN`.

## **Acheter du `CITIZEN`**

Uniquement des entreprises peuvent acheter du `CITIZEN` (afin qu'elles puissent verser des salaires en `CITIZEN`).  
Ces entreprises devront s'enregistrer auprès de l'état, et cet enregistrement devra être validé par le conseil des sages.

## **Administrateurs: conseil des sages**

Des administrateurs, le conseil des sages, pourront participer aux tâches de gouvernances et d'administrations de l'état pour cela ils devront mettre en dépôt 100 `CITIZEN`.
Ce dépôt sera la garantie qu'ils feront correctement leur travail d'administrateur.
Les administrateurs votent pour effectuer les tâches d'administration comme utiliser les fonds des impôts récoltés ou encore valider l'enregistrement d'une entreprise qui pourront ensuite acheter du `CITIZEN`.  
En cas de mauvaise gestion ils pourront passer devant un tribunal populaire.
Une mauvaise gestion consiste en un `crime contre la nation`.  
Les administrateurs sont élus par les citoyens. L'élection d'un administrateur dure 1 semaine.  
Ils sont élus pour une durée de 8 semaines.
Les administrateurs sont des citoyens qui peuvent effectuer des tâches d'administration.

## **Tribunaux populaires**

Dans cet état les peines consistent à se faire retirer du `CITIZEN`.
3 types de peines:

- légère: retire 5 `CITIZEN` au citoyen qui passe en jugement.
- lourde: retire 50 `CITIZEN` au citoyen qui passe en jugement.
- grave: retire 100 `CITIZEN` au citoyen qui passe en jugement.
- crime contre la nation: retire tous les `CITIZEN` du citoyen (compte courant, retraite, assurance maladie etc) et il est banni pendant 10 ans. Ses fonds sont ensuite reversés dans la caisse d'impôt commune.

## **Les citoyens**

Les citoyens sont identifiés par leur adresse Ethereum.
Vous devrez réfléchir aux différents attributs qui définissent un citoyen (malade, chômage, banni ?).  
Un citoyen peut se faire bannir pendant 10 ans.

## **impôts**

Lorsqu'un citoyen perçoit des revenus, 10% sont automatiquement envoyés dans une caisse commune à tous les citoyens.
A tout moment les citoyens peuvent consulter combien la caisse contient.  
L'utilisation des fonds de cette caisse ne peut être effectué que par les sages.

## **chômage**

Lorsqu'un citoyen perçoit des revenus, 10 % sont automatiquement envoyés dans une caisse d'allocation chômage. Il ne pourra en bénéficier que si il est au chômage.
Le statut de chômeur ne pourra être validé que par les sages.

## **assurance maladie**

Lorsqu'un citoyen perçoit des revenus, 10% sont automatiquement envoyés dans sa caisse d'assurance maladie. Il ne pourra en bénéficier que si il est malade.
Le statut de congés maladie ne pourra être validé que par les sages.

## **retraite**

Lorsqu'un citoyen perçoit des revenus en `CITIZEN`, 10% sont automatiquement mit en dépôt pour sa retraite. Il ne pourra retirer ces fonds qu'a ses 60 ans (Calculer 60 ans en semaines).

## **Décès**

Lorsqu'un citoyen décède, ses fonds sont versés dans la caisse d'impôts commune.
Ce transfère de fond ne peut être effectué que par les sages.
