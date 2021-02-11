# Setup a development environment

# Update your OS

Mettre à jour votre système d'exploitation afin de bénéficier des dernières updates.  
Un système non à jour ou obsolète ne pourra pas supporter tous les outils de développements que nous utiliserons au cours de cette formation.

## Windows

Utiliser `windows update``

## macOS

Utiliser l'app store ou les `mises à jour de logiciels` dans les `préférences système`

## Linux

```zsh
sudo apt-get update
sudo apt-get upgrade
```

# Install VSCode

Installer VSCode: https://code.visualstudio.com/  
L'installation est automatique sur Windows et macOS.  
Pour les installations sur Linux il faudra suivre ces instructions: https://code.visualstudio.com/docs/setup/linux  
Au terme de cette installation essayez ouvrir VSCode, bien que l'on peut pas encore l'utiliser pour programmer encore.

# WSL 2: Windows

## Activer le mode développeur dans les paramètres windows

Dans `Paramètres > Espace développeurs` activer le `Mode développeur`

## Activer l'affichage des `Extensions de noms de fichiers`

Ouvrir un explorateur windows puis dans `Affichage` cocher `Extensions de noms de fichiers`

## Activer les options de virtualisation dans votre Bios

WSL2 nécessite un support hardware pour la virtualisation.
Ces options peuvent être activées dans votre Bios.

## Install WSL2 et Windows Terminal

Suivre la procédure d'installation manuelle de WSL2 et de `Windows terminal` [ici](https://docs.microsoft.com/fr-fr/windows/wsl/install-win10#manual-installation-steps)  
**A l'étape 6 de la procédure installer `Ubuntu 20.04 LTS`**
Ouvrez `Windows Terminal` et vérifier que Ubuntu est correctement installé avec la version 2 de WSL en exécutant:

```zsh
wsl --list --verbose
```

## Update your `Ubuntu 20.04 LTS`

Depuis `Windows terminal` ouvrir un onglet `Ubuntu-20.04` et exécuter:

```zsh
sudo apt-get update && sudo apt-get upgrade -y
```

Vous avez maintenant Ubuntu d'installé et à jour, vous pouvez passer au chapitre suivant `Linux` pour installer `nvm` et `Node.js`.

# Linux

Sous Linux il est préferable d'installer `nvm` qui est un manager de version `Node.js`.  
**nvm github repository**: https://github.com/nvm-sh/nvm

## Install nvm

```zsh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
```

Fermer le terminal, puis ouvrir un autre terminal pour appliquer les changements appliqués aux variables d'environnement.

Si `nvm` est correctement installé la commande suivante doit vous retourner "nvm":

```zsh
command -v nvm
```

## Install Node.js

```zsh
nvm install node
```

Vérifier que `Node.js` est accessible et correctement installé en exécutant:

```zsh
node --version
```

# macOS

## install brew

`brew` est un `package manager` accessible en ligne de commande, donc depuis un terminal.  
Il est l'équivalent du gestionnaire de package `apt` sous Ubuntu/Debian.  
Installer le package manager `brew` en exécutant dans un terminal la commande suivante:

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Mettre à jour:

```zsh
brew update
```

## install Node.js

```zsh
brew install node
```

Vérifier que `Node.js` est accessible et correctement installé en exécutant:

```zsh
node --version
```

# VSCode extensions
