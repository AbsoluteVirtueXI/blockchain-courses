# **node introduction**

node.js est un **asynchronous event-driven JavaScript runtime** qui permet d'éxecuter du code javascript sur votre système d'exploitation.  
Votre code javascript est ainsi executé dans un environement monothread, non bloquant, privilégeant ainsi la programmation d'application suivant une architecture orientée événements (_event driven architecture_).

![execution models](../res/execution-models.jpeg)
<br/><br/>

## **command line**

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

## **Execute javascript files**

_hello.js_:

```js
// hello.js
let name = 'alyra'
for (let i = 0; i < 10; ++i) {
  console.log(`Hello, ${name}`)
}
```

```zsh
% node hello.js
Hello, alyra
Hello, alyra
Hello, alyra
Hello, alyra
Hello, alyra
Hello, alyra
Hello, alyra
Hello, alyra
Hello, alyra
Hello, alyra
```

## **Create a new project**

### **Manually**:

- create a new project on github
- initialize your new project with git:

  ```zsh
  % git init my-project
  ```

- change the working directory to your project:

  ```zsh
  % cd my-project
  ```

- initialize your project with yarn:

  ```zsh
  % yarn init -y
  ```

- add or generate a _.gitignore_ file:  
  Use **.gitignore Generator** for vscode or copy and enhance this template: https://github.com/github/gitignore/blob/master/Node.gitignore

- update the git index:

  ```zsh
  % git add .
  ```

- create first commit:

  ```zsh
  % git commit -m "First commit"
  ```

- add github remote repository and set the branch:

  ```zsh
  % git remote add origin https://github.com/alyra-student/my-project.git
  % git branch -M master
  ```

- push the first commit:

  ```zsh
  % git push -u origin master
  ```

### **djinit**:

- create a new project on github
- create your project with djinit:

  ```zsh
  % npx djinit my-project
  ```

- change the working directory to your project:

  ```zsh
  % cd my-project
  ```

- add github remote repository and set the branch:

  ```zsh
  % git remote add origin https://github.com/alyra-student/my-project.git
  % git branch -M master
  ```

- push the first commit:

  ```zsh
  % git push -u origin master
  ```

## **configuration: package.json**

https://docs.npmjs.com/files/package.json

## **usefull yarn commands**

Initialize a node.js project:

```zsh
% mkdir my-project
% cd my-project/
% yarn init -y
```

Install a dependency:

```zsh
% yarn add a-package
```

Install a global dependency (not recommended):

```zsh
% yarn global add a-package
```

Install the dependencies defined in a **_package.json_** file:

```zsh
% yarn install
```

Install a dev dependency:

```zsh
% yarn add a-package --dev
```

Upgrade all the dependencies to their latest version:

```zsh
% yarn upgrade
```

Upgrade only one dependency:

```zsh
% yarn upgrade a-package
```

Remove a dependency:

```zsh
% yarn remove a-package
```

Publish a package defined by the **_package.json_** in the current directory:

```zsh
% yarn publish
```

Run scripts defined in your **_package.json_**:  
_package.json_:

```json
{
  "name": "my-package",
  "scripts": {
    "build": "babel src -d lib",
    "test": "jest"
  }
}
```

```zsh
% yarn run test
```

is equivalent to:

```zsh
% yarn test
```

<br />

```zsh
% yarn run build
```

is equivalent to:

```zsh
% yarn build
```

For an exhaustive list of all yarn commands check the official documentation: https://classic.yarnpkg.com/fr/docs/cli

## **npm vs yarn**

`npm install` === `yarn`  
`npm install taco --save` === `yarn add taco`  
`npm uninstall taco --save` === `yarn remove taco`  
`npm install taco --save-dev` === `yarn add taco --dev`  
`npm update --save` === `yarn upgrade`  
`npm install taco@latest --save` === `yarn add taco`  
`npm install taco --global` === `yarn global add tac`  
`npm init` === `yarn init`  
`npm link` === `yarn link`  
`npm outdated` === `yarn outdated`  
`npm publish` === `yarn publish`  
`npm run` === `yarn run`  
`npm cache clean` === `yarn cache clean`  
`npm login` === `yarn login` (and logout)  
`npm test` === `yarn test`  
`npm install --production` === `yarn --production`
