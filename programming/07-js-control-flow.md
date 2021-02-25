# Control flow in Javascript

## if / else / else if

### Si une condition est vrai alors

```js
doSomethingBeforeIf()
if (boolean_expression) {
  // if boolean_expression is true then
  doSomethingInsideIf()
}
// continue execution here
doSomethingAfterIf()
```

Les fonctions `doSomethingBeforeIf` et `doSomethingAfterIf` seront toujours exécutées.
la fonction `doSomethingInsideIf()` est dans un `block` `if`. Elle ne sera exécutée que si `boolean_expression` est évaluée à `true`.

### Si une condition est vrai alors ..., sinon ...

```js
doSomethingBeforeIfElse()
if (boolean_expression) {
  // if boolean_expression is true then
  doSomethingInsideIf()
} else {
  // if boolean_expression is false then
  doSomethingInsideElse()
}
doSomethingAfterIfElse()
```

Les fonctions `doSomethingBeforeIfElse` et `doSomethingAfterIfElse` seront toujours exécutées.
la fonction `doSomethingInsideIf()` est dans un `block` `if`. Elle ne sera exécutée que si `boolean_expression` est évaluée à `true`.
Si `boolean_expression` est évaluée à `false` alors `doSomethingInsideElse()` sera exécutée.

### Si une condition est vraie alors ..., sinon si une autre condition est vraie alors ..., sinon....

```js
doSomethingBefore()
if (boolean_expression1) {
  // if boolean_expression1 is true then
  doSomethingInsideIf1()
} else if (boolean_expression2) {
  // else if boolean_expression2 is true then
  doSomethingInsideIf2()
} else if (boolean_expression3) {
  // else if boolean_expression3 is true then
  doSomethingInsideIf3()
} else {
  // if boolean_expression1 && boolean_expression2 boolean_expression3 is false then
  doSomethingInsideElse()
}
doSomethingAfter()
```

Exécuter la fonction `doSomethingBefore`
Si `boolean_expression1` est `true` alors exécuter `doSomethingInsideIf1()`
Sinon si `boolean_expression2` est `true` alors exécuter `doSomethingInsideIf2()`
Sinon si `boolean_expression3` est `true` alors exécuter `doSomethingInsideIf3()`
Exécuter la fonction `doSomethingAfter`.

Exemple:

```js
let nb = 10
if (isNaN(nb)) {
  console.log(`${nb} is not a number`)
} else if (nb % 2 === 0) {
  console.log(`${nb} is an even number`)
} else if (nb % 2 !== 0) {
  console.log(`${nb} is an odd number`)
} else {
  // Il est techniquement impossible de trigger ce block else
  console.log('How did you reach this branch !!???')
}
```

Des conditions peuvent être incluses dans les blocs d'autres conditions

```js
let age = 35
if (!isNaN(age)) {
  if (age > 18) {
    console.log(`You can vote`)
  } else console.log(`You can not vote`)
} else {
  console.log(`${age} is not a valid number`)
}
```

```js
let password = '123'
if (password[0] === '1') {
  if (password[1] === '2') {
    if (password[2] === '3') {
      console.log('Ok: good password')
    } else {
      console.log('Bad: password')
    }
  } else {
    console.log('Bad: bad password')
  }
} else {
  console.log('Bad: bad password')
}
```

Imbriquer des `if` ensemble peut être simplifié si la même action est effectuée dans le cas d'une évaluation à `false` des conditions:

```js
let password = '123'
if (password[0] === '1' && password[1] === '2' && password[2] === '3') {
  console.log('Ok: good password')
} else {
  console.log('Bad: bad password')
}
```

Evidement la solution idéale, mais qui illustre mal ce cours serait:

```js
let password = '123'
if (password === '123') {
  console.log('Ok: good password')
} else {
  console.log('Bad: bad password')
}
```

## Conditional ternary operator

La structure conditionnelle `if/else` est tellement commune qu'un opérateur conditionnel ternaire a été créer comme raccourci syntaxique.  
Le `conditional (ternary) operator` est le seul opérateur en JavaScript qui prend 3 opérandes:

- une condition suivie d'un `?`
- Puis une expression à évaluer si la condition est `true` suivit d'un`:`
- Puis une expression à évaluer si la condition est `false`.

```js
let age = 30
let msg = age > 18 ? 'You can vote' : 'You can not vote'
console.log(`${msg}`)
```

Il faut bien comprendre que cet opérateur appliqué a ses opérandes est une expression il peut donc être évalué à une valeur.
Pour écrire la même chose avec un `if/else` classique:

```js
let age = 30
let msg = ''
if (age > 18) {
  msg = 'You can vote'
} else {
  msg = 'You can not vote'
}
console.log(`${msg}`)
```

Un `Ternary operator` est une expression, il peut donc être une opérande d'un autre `Ternary operator`:

```js
let nb = 7
let isOdd = isNaN(nb) ? false : nb % 2 !== 0 ? true : false
console.log(`${nb} is ${isOdd ? '' : 'not '}an odd number`)
```

Il est beaucoup utilisé dans `React` pour faire de l'affichage conditionnel.

## switch

Nous avons vu précédemment comment brancher notre flot d'exécution en fonction de plusieurs conditions avec la structure conditionnelle `if/else if/else`.

```js
let selectedRace = 'orc' // race chosen by player
if (selectedRace === 'human') {
  console.log(
    'The noble warriors of humanity employ both a strong military and powerful magics in the defense of their shining kingdoms.'
  )
} else if (selectedRace === 'elf') {
  console.log(
    'The reclusive Night Elves were the first race to awaken in the World of Warcraft. These shadowy, immortal beings were the first to study magic and let it loose throughout the world nearly ten thousand years before Warcraft I.'
  )
} else if (selectedRace === 'orc') {
  console.log(
    'The Orcs, who once cultivated a quiet Shamanistic society upon the world of Draenor, were corrupted by the chaos magics of the Burning Legion and formed into a voracious, unstoppable Horde.'
  )
} else if (selectedRace === 'undead') {
  console.log(
    "The horrifying Undead army, called the Scourge, consists of thousands of walking corpses, disembodied spirits, damned mortal men and insidious extra-dimensional entities. The Scourge was created by the Burning Legion for the sole purpose of sowing terror across the world in anticipation of the Legion's inevitable invasion."
  )
} else {
  // Default case
  console.log("You will be troll. Don't try to break my program next time.")
}
```

Il est préférable d'utiliser un `switch` plutôt qu'une longue suite de `else if`.
Le programme devient plus lisible.
La structure conditionnelle `switch`:

```js
switch (expression) {
  case value1:
    //Statements executed when the
    //result of expression matches value1
    [break;]
  case value2:
    //Statements executed when the
    //result of expression matches value2
    [break;]
  ...
  case valueN:
    //Statements executed when the
    //result of expression matches valueN
    [break;]
  [default:
    //Statements executed when none of
    //the values match the value of the expression
    [break;]]
}
```

`expression` est évaluée, puis est comparée avec le premier `case` avec un `===`.  
Si le match est fait et que la comparaison return `true` alors la clause du case est exécutée.  
Si dans cette clause un `break` est rencontré alors on sort du `switch` sinon on continue avec la clause suivante.
Si aucun match n'est effectuée avec les différentes clause alors la clause `default` est exécutée.

Réécriture notre code de sélection de race pour notre jeu avec un `switch`:

```js
let selectedRace = 'orc' // race chosen by player
switch (selectedRace) {
  case 'human':
    console.log(
      'The noble warriors of humanity employ both a strong military and powerful magics in the defense of their shining kingdoms.'
    )
    break
  case 'elf':
    console.log(
      'The reclusive Night Elves were the first race to awaken in the World of Warcraft. These shadowy, immortal beings were the first to study magic and let it loose throughout the world nearly ten thousand years before Warcraft I.'
    )
    break
  case 'orc':
    console.log(
      'The Orcs, who once cultivated a quiet Shamanistic society upon the world of Draenor, were corrupted by the chaos magics of the Burning Legion and formed into a voracious, unstoppable Horde.'
    )
    break
  case 'undead':
    console.log(
      "The horrifying Undead army, called the Scourge, consists of thousands of walking corpses, disembodied spirits, damned mortal men and insidious extra-dimensional entities. The Scourge was created by the Burning Legion for the sole purpose of sowing terror across the world in anticipation of the Legion's inevitable invasion."
    )
    break
  default:
    // Default case
    console.log("You will be troll. Don't try to break my program next time.")
}
```

Attention à bien insérer un `break` pour sortir du switch, sinon le `case` suivant sera testé!!!
Mais cela peut être le comportement désiré:

```js
const expr = 'Papayas'
switch (expr) {
  case 'Oranges':
    console.log('Oranges are $0.59 a pound.')
    break
  case 'Mangoes':
  case 'Papayas':
    console.log('Mangoes and papayas are $2.79 a pound.')
    break
  default:
    console.log(`Sorry, we are out of ${expr}.`)
}
```
