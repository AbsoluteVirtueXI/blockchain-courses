# Operators, expressions and statements in Javascript

## Operators

Ils existent de nombreux opérateurs en Javascript.
Ces opérateurs s'appliquent à des données / expressions et retournent d'autres données / expressions.

```js
let a = 1 + 2
```

Dans l'exemple ci dessus on a 2 opérateurs qui sont appliqués dans un ordre qui dépend de la priorité des l'opérateurs.
`1 + 2` est d'abord évalué à `3`, l'opérateur `+` est appliqué sur l'opérande de gauche et droite.  
Puis ensuite l'opérateur d'assignement `=` assigne l'opérande de droite, qui est `3` à son opérande de droite qui est la variable `a`.

```js
let a = [1, 2, 3]
let b = a[2] * 3 + 4 / 2
```

L'ordre d'application des opérateurs est basé sur la priorité de chacun dans une expression
Dans l'exemple ci dessus l'opérateur d'accès à un membre `[]` est prioritaire donc il est appliqué avant tous les autres opérateurs:

```js
3 * 3 + 4 / 2
```

Ensuite la multiplication et la division ont la même priorité, on les applique donc de gauche à droite.

```js
9 + 2
```

Ensuite il reste l'opérateur d'addition a appliqué:

```js
11
```

L'opérateur d'assignement possède l'une des priorités les plus basses il sera donc appliqué à la fin:

```js
let b = 11
```

On peut se servir des parenthèses pour grouper des opérations.
Les parenthèses est l'opérateur le plus prioritaire en Javascript.
Ci dessous l'addition sera appliquée avant la multiplication grâce aux parenthèses:

```js
let result = 2 * 3 * (10 + 1)
```

Il n'est pas recommandé d'abuser des parenthèses.  
On peut rajouter des parenthèses si notre expression est complexe ou longue (les longues expressions sont a éviter) et qu'elles aident à la lecture de notre code.

```js
let canVote =
  (isFrench && isAdult && isFranceResident) ||
  (hasProcuration && isValidProcuration)
```

**Dans le doute toujours se référer la table de priorité des opérateurs:**  
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Operator_Precedence#table

**Une liste exhaustive de tous les opérateurs en Javascript:**
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators

## Expressions

L'application des opérateurs à leurs opérandes sont des expressions.
Une variable, ou une donnée littérale comme `1` ou `'Hello World'` est aussi une expression.
Tout ce qui peut être évalué à une donnée que l'on peut stocké dans une variable
Règle de base: **Si vous pouvez l'assigner à une variable alors c'est une expression**

## Statements

Par déduction les `statements` sont tout ce qui n'est pas une expression.
Comme `if{}`, `for(){..}`.
Les `statements` ne sont pas évalués à une valeur.  
Ils servent généralement à exécuter des instructions
