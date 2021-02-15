# Git basics

## Create a github profile

https://github.com/

## Create a new repository for your code on github

Voir démo pour créer un nouveau repo sur github

## Create a new local repository on your machine

Si vous partez de zéro:

```zsh
mkdir testfordwd
cd testfordwd
git init
echo "# testfordwd" >> README.md
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/AbsoluteVirtueXI/testfordwd.git
git push -u origin main
```

Si vous voulez push un repository local déjà existant:

```zsh
git remote add origin https://github.com/AbsoluteVirtueXI/testfordwd.git
git branch -M main
git push -u origin main
```

## Configure ssh connection to github

https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh
