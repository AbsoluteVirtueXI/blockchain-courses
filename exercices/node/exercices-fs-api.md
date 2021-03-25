# Exercices fs api

Ces exercices devront tous être pushés sur un repository accessible depuis github.  
Ce repository devra se nommer `exo-fs-api`.  
Suivez les instructions des cours précédents pour initialiser votre répertoire de travail en package Node.js avec `yarn init`.  
Vous devrez fournir le lien de votre repo github dans le formulaire de rendus d'exercices suivant: https://forms.gle/hodtGoSpJuqireE89
Essayez d'aller le plus loin possible.  
Certains exercices nécessitent une réflexion approfondie prenez votre temps pour anticiper les différentes étapes que devra traiter votre programme.

Tous les programmes que vous devez créer utilisent une interaction avec la ligne de commande.  
Il faut absolument vérifier que les inputs envoyés à votre programme sont corrects et que votre programme ne se retrouve jamais dans un état indéfini, **tout doit être sous contrôle et un message clair doit être affiché à l'utilisateur en cas de mauvaise manipulation de la ligne de commande.**

## echo.js

Ce programme n'utilise pas l'api `fs`

```zsh
node echo.js hello hard fork
hello hard fork
```

Affiche à l'écran les strings passées en arguments.

## cat.js

```zsh
node cat.js file.txt
```

Affiche le contenu de _file.txt_ sur l'écran
Gestion d'erreur si pas le bon nombre d'arguments.  
Gestion d'erreur si _file.txt_ n'existe pas.

## cp.js

```zsh
node cp.js src.txt dst.txt
```

Copie _src.txt_ vers _dst.txt_.  
Gestion d'erreur si pas le bon nombre d'arguments.  
Gestion d'erreur si src.txt n'existe pas.

## cat.js

Améliorer l'exercice `cat.js` précédent en ajoutant la possibilité d'afficher plusieurs fichiers.

```zsh
node cat.js file1.txt file2.txt file3.txt
```

Affiche le contenu de _file1.txt_, _file2.txt_, _file3.txt_ à la suite sur l'écran.  
Gestion de l'erreur si pas le bon nombre d'arguments.  
Gestion de l'erreur si l'un des fichiers à afficher n'existe pas.

## append.js

```zsh
node append.js src1.txt src2.txt src3.txt dst.txt
```

Copie le contenu de _src1.txt_, _src2.txt_, _src3.txt_ vers _dst.txt_.  
`append.js` prend un nombre variable d'arguments, minimum 2 arguments.  
Le fichier de destination sera toujours le dernier de la liste:

```zsh
node append.js src.txt dst.txt
node append.js src1.txt src2.txt dst.txt
```

Gestion de l'erreur si pas le bon nombre d'arguments.  
Gestion de l'erreur si l'un des fichiers sources à copier n'existe pas.

## tail.js

```zsh
node tail.js file.txt
```

Affiche les 10 dernières lignes du fichier file.txt.  
Gestion de l'erreur si pas le bon nombre d'arguments.  
Gestion de l'erreur si _file.txt_ n'existe pas.

## tail.js

Améliorer le programme précédent pour prendre en compte le paramètre optionnel `-n`.
Par défaut `tail` affiche les 10 dernières ligne du fichier passé en paramètres, `-n` permet d'indiquer le nombre de dernières lignes à afficher:

```zsh
node tail.js -n 20 file.txt
```

Affiche les 20 dernières lignes du fichier _file.txt_.  
Attention `-n` suivi d'un nombre est optionnel, ne pas l'utiliser doit exécuter un affichage des 10 dernières ligne du fichier par défaut.  
Gestion de l'erreur si pas le bon nombre d'arguments.  
Gestion de l'erreur si _file.txt_ n'existe pas.  
Gestion de l'erreur si un mauvais argument optionnel est passé.  
Gestion de l'erreur si le nombre ligne passé en arguments n'est pas convertible en nombre.

## wc.js

```zsh
node wc.js file.txt
279    1211   13376 file.txt
```

Affiche le nombre de lignes, mots et caractères du fichier _file.txt_.  
Gestion de l'erreur si pas le bon nombre d'arguments.  
Gestion l'erreur si _file.txt_ n'existe pas.

## wc.js

Améliorer l'exercice précédent en ajoutant la possibilité de passer des paramètres optionnels:
`-l`: pour afficher le nombre de lignes uniquement.  
`-w`: pour afficher le nombre de mots uniquement.  
`-c`: pour afficher le nombre de caractères uniquement.  
Pour simplifier l'exercice nous supposerons que seulement 1 seul paramètres optionnel peut être passé en même temps.

```zsh
node wc.js file.txt
279    1211   13376 file.txt
```

```zsh
node wc.js -l file.txt
279 file.txt
```

```zsh
node wc.js -w file.txt
1211 file.txt
```

```zsh
node wc.js -c file.txt
13376 file.txt
```

Gestion de l'erreur si pas le bon nombre d'arguments.  
Gestion de l'erreur si le paramètre optionnel passé n'existe pas.  
Gestion l'erreur si _file.txt_ n'existe pas.
