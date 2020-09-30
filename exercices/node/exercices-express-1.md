# Exercices express partie 1

Vous devez mettre tous les exercices dans 1 unique repository qui est accessible depuis github.  
Créez un nouveau repo sur github et utilisez l'utilitaire `djinit` pour créer le repo en local sur votre machine: [instruction](https://github.com/AbsoluteVirtueXI/alyra-courses/blob/master/node/1-node-introduction.md#djinit)  
**LE PROJET CONTENANT VOS EXERCICES DOIT OBLIGATOIREMENT ETRE CREE AVEC L UTILITAIRE DJINIT**

Les exercices qui suivent sont une amélioration de l'exercice 1.  
Vous devrez à chaque fois améliorer l'exercice précedent et lui ajouter les fonctionalités demandées dans l'exercice

## 1

Créer une programme _app.js_ qui utilise express.
Cette application devra tourner sur `localhost` et le port `7777`.
Avec votre navigateur en se connectant sur http://localhost:7777 on devra récupérer le message '**Exercices express partie 1**'
Pour cela il faudra créer une route qui manage le path `/`

## 2

Ajouter une route `/aboutme` qui retournera à l'utilisateur des informations à propos de vous

## 3

Ajouter une route `/aboutyou` qui retournera à l'utilisateur des informations le concernant comme:

- son ip
- son user agent, c'est la version de son navigateur.
  Cette information peut être extraite depuis la propriété `headers` de la requête de l'utilisateur

## 4

Ajouter une route `/vote` qui contient 1 paramètre qui correspondera à l'age.
En fonction de l'age passé en paramètre on retournera les messages suivants dans le navigateur:

- si age < 18, par example http://localhost:7777/age/17,
  on devra retourner 'trop jeune pour voter'
- si age >= 18, par example http://localhost:7777/age/19,
  on devra retrouver 'Vous pouvez voter'

## 5

Ajouter une route `/palindrome`qui prendra un mot en paramètre.
Un message devra être retourné à l'utilisateur si le mot est un palindrome.
Vous pouvez vous inspirer de la correction de l'exercice: https://github.com/AbsoluteVirtueXI/alyra-courses/blob/master/exercices/node/correction-exercices-cmd/palindromeChecker.js

## 6

Ajouter une route `/oddtest` qui prendra un nombre en paramètre.
Un message devra être retourné pour indiquer que le nombre passé en paramètre est pair ou impair

- si le nombre est pair, par example http://localhost:7777/oddtest/2,
  on devra retourner 'pair'
- si le nombre est impair, par example http://localhost:7777/oddtest/19,
  on devra retrouver 'impair'

Vous pouvez vous inspirer de la correction de l'exercice: https://github.com/AbsoluteVirtueXI/alyra-courses/blob/master/exercices/node/correction-exercices-cmd/oddTest.js

## 7 **testServer.js**

Ecrivez un script _testServer.js_ qui se connectera aux différentes url de votre serveur qui affichera dans la console les messages récupérés. _testServer.js_ utilisera le package `axios` pour éffectuer les connections
