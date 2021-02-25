# Exercices expressions and conditions

Ces exercices devront tous être pushés sur un repository accessible depuis github.  
Ce repository devra se nommer `exo-expressions-conditions`
Vous devrez fournir ce lien dans le formulaire de rendus d'exercices suivant: https://docs.google.com/forms/d/e/1FAIpQLSc6C1su3FLwG1ESO4PfhWLjnOUe8dngO7Ddvx3Md9s2X55M5w/viewform

Essayez d'aller le plus loin possible.  
Les exercices qui nécessitent une réflexion approfondie sont sous la section: **Challenge**

## vote.js

Réécrire le programme suivant avec un ou deux `ternary operator`:

```js
let age = 17
let canVote = false
if (age >= 18) {
  canVote = true
} else {
  canVote = false
}
if (canVote) {
  console.log('You can vote')
} else {
  console.log('You can not vote')
}
```

## welcome.js

En fonction du prénom (`firstName`) et du genre de l'utilisateur(`gender`) lui afficher le message correspondant. Vous devrez utiliser un `ternary operator` pour cela.  
La variable `firstName` contiendra le prénom de l'utilisateur.  
la variable `gender` contiendra le genre de l'utilisateur avec comme valeur `male` ou `female`.  
Vous devrez afficher par exemple pour un homme prénommé `Bob`:

```txt
Bonjour Bob, vous êtes entré sur le chan
```

Vous devrez afficher pour une femme prénommée `Alice`:

```txt
Bonjour Alice, vous êtes entrée sur le chan
```

## crackme06.js

Réécrire la fonction `crackme6` suivante avec un seul `if`:

```js
let password = '1a2b!AZEAZEAZEAZEAZEAZEAZ'
const crackme6 = (password) => {
  if (password[0] === '1') {
    if (password[1] === 'a') {
      if (password[2] === '2') {
        if (password[3] === 'b') {
          if (password[4] === '!' && password.length > 13) {
            console.log('OK')
          } else {
            console.log('BAD')
          }
        } else {
          console.log('BAD')
        }
      } else {
        console.log('BAD')
      }
    } else {
      console.log('BAD')
    }
  } else {
    console.log('BAD')
  }
}

crackme6(password)
```

## countVowel.js

Dans la correction de cet exercice: https://github.com/AbsoluteVirtueXI/blockchain-courses/blob/master/exercices/programming/corrections-numbers-and-strings.md/countVowel.js
Nous avons utilisé une suite de `if / else if ` pour compter les différentes voyelles d'un texte.  
Réécrivez le même exercice mais avec un `switch`.

## fixMe.js

Ce programme est incorrect:

```js
let list = "'Alice', 'Bob', 'Charlie', 'Craig', 'Eva'"
for (let j = 0; j <= list.length; ++i) {
  list[i] = list[i].toLowerCase()
  switch (list[i]) {
    Case ALICE:
      consol.log('Alice want to exchange with Bob')
    Case BOB:
      console.log('Bob want to exchange with Alice')
    Case CHARLIE:
      console.log('Charlie is a generic third participant')
    Case CRAIG:
      console.log('Craig is a password cracker')
    Case EVE:
      console.log('Eve is an eavesdropper')
  }
}
```

Vous devez corriger le code précédent et obtenir l'affichage suivant:

```text
Alice want to exchange with Bob
Bob want to exchange with Alice
Charlie is a generic third participant
Craig is a password cracker
Eve is an eavesdropper
```

# Challenge

## elevator.js

En utilisant une structure conditionnelle `switch` (mais pas que), simulez le fonctionnant d'un ascenseur qui devra gérer 1 trajet pour un utilisateur.
L'ascenseur peut amener notre utilisateur de l'étage `-2` à `7`.
L'ascenseur devra aussi prendre en compte si un utilisateur est déjà à l'étage qu'il a sélectionné.
Les départs et les arrivées d'un étage seront affichés avec un `console.log`
Les variables à utiliser et que vous manipulerez pour simuler le choix d'un utilisateur seront:
`currentFloor`: Pour l'étage actuel de l'utilisateur
`targetFloor`: Pour l'étage où souhaite se rentre l'utilisateur

## elevator.js

Installer globalement le package manager `yarn`:

```zsh
npm install --global yarn
```

On verra ce qu'est `yarn` très prochainement.

Dans votre répertoire de travail, celui ou sont vos exercices, entrer la commande suivante:

```zsh
yarn init -y
```

Puis taper la commande pour installer le package `chalk`

```zsh
yarn add chalk
```

En vous référant à la documentation officielle: https://github.com/chalk/chalk , Afficher les différents messages de votre ascenseur avec différentes couleurs.
**Attention désormais vous devrez lancer votre programme directement depuis la console et non plus via l'extension `code runner`**:

```zsh
node elevator.js
```
