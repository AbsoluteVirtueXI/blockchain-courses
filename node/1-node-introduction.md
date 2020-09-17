# node introduction

node.js est un **asynchronous event-driven JavaScript runtime** qui permet d'éxecuter du code javascript sur votre système d'exploitation.  
Votre code javascript est ainsi executé dans un environement monothread, non bloquant, privilégeant ainsi la programmation d'application suivant une architecture orientée événements (_event driven architecture_).

## command line

Executer node sur votre ligne de commande vous donne accès au REPL (read-eval-print-loop) qui est interpreteur javascript interactif.

```zsh
    % node
    Welcome to Node.js v14.10.1.
    Type ".help" for more information.
    >
```

Vous pouvez ainsi executer du code javascript:

```js
    > let name = 'Alyra'
    > let msg = `Hello, ${name}`
    > console.log(msg)
    Hello, Alyra
```

Vous avez aussi accès à une calculatrice intégrée, facilement accessible:

```js
    > (3 + 5 + 7) / 5 * 3 ** 10
    177147
```

## create a new project

## configuration: package.json

## usefull yarn commands
