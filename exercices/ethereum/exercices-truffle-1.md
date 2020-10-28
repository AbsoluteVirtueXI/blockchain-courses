# Exercices Truffle 1

Vous devrez rendre un projet `Truffle` qui est accessible depuis github.  
Créez un nouveau repo sur github et pusher le repo local qui est sur votre machine.  
**Ce projet ne doit pas être créé avec djinit, mais impérativement être créé à la main**

## 1 Project Calculator

Suivez le cours et créer un nouveau projet `Calculator`.
Vous devrez posséder un projet qui suit exactement ce qui a été vu en cours.

## 2 Error Linter

Corrigez toutes les erreurs que révèle les linters `solhint` et `eslint`.
Déployez nos smart contracts sur `ganache`.

## 3 tests des smart contracts

Suivant la même logique que pour les tests de `Adder` et `Suber`, écrivez les tests pour `Multiplier` et `Divisor`.
Dans le répertoire `test/` écrivez un autre fichier `calculator.test.js` qui contiendra les tests pour le smart contract `Calculator`.  
Vous devrez trouvez quels sont les tests les plus pertinents pour confirmez que nos smart contract sont corrects et sans bug.
N'oubliez pas dans le cadre de vos tests sur le smart contract `Calculator` d'obtenir une instance de `Adder`, `Subber`, `Multiplier`, `Divisor` avec la méthode `.new()`, car `Calculator` a besoin de connaitre l'adresse de ces smart contracts pour être correctement déployé.

Lancez vos tests avec `yarn test`.

## 4 React

Pour le semaine prochaine une bonne connaissance de `Reactjs` sera nécéssaire, **commencez dès maintenant** à suivre les cours de paulina sur: https://github.com/pehaa/alyra-dwd-support/tree/master/react

Vous devrez être à l'aise avec certains hooks comme `useEffect`, `useContext`, `useState`, etc...
