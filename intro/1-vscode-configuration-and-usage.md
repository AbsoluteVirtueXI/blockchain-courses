# VSCode configuration and usage

The objective of this course is to setup a decentralized web application development environment and learn how to use the installed tools.

## Prerequisites

- **Visual Studio code** is installed.  
  If it is not installed download it from https://code.visualstudio.com/Download
- **node.js** is installed and version is >= **14.0.0**:

  ```zsh
  % node --version
  v14.10.1
  ```

- **yarn** is installed and version is >= **1.22.0**

  ```zsh
  % yarn --version
  1.22.5
  ```

## Install VSCode extensions

Extensions are usefull tools for making your development process easier.

- [code runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner): run code snippet or code file.
- [prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode): a configurable code formatter.
- [eslint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint): statically analyze and automatically fix your code.
- [Bracket Pair Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2): This extension allows matching brackets to be identified with colours.
- [.gitignore Generator](https://marketplace.visualstudio.com/items?itemName=piotrpalarz.vscode-gitignore-generator): generate .gitignore files

## Global configuration

- auto formatting on save:  
  In **Preferences > Settings** under **User**, in **Text Editor > Formatting** check **Format on Save**
- auto saving:  
  In **Preferences > Settings** under **User**, in **Text Editor > Files > Auto Save** select **onFocusChange**
