# Puissance 4 en lignes de commandes

Ecrivez un programme qui est l'équivalent du célébre jeu Puissance 4 mais en ligne de commande.  
les régles du jeu: https://www.regles-de-jeux.com/regle-du-puissance-4/  
Via la ligne de commande 2 joueurs s'affrontent tour à tour en placant leurs jetons sur la grille.  
Il y a autant de jetons qu'il y a d'emplacement sur la grille.  
Par défaut nous utiliserons une grille de 6 lignes sur 7 colonnes.

La grille se presentera de cette maniere:

```zsh
      1   2   3   4   5   6   7
    +---+---+---+---+---+---+---+
  6 |   |   |   |   |   |   |   |
    +---+---+---+---+---+---+---+
  5 |   |   |   |   |   |   |   |
    +---+---+---+---+---+---+---+
  4 |   |   |   |   |   |   |   |
    +---+---+---+---+---+---+---+
  3 |   |   |   |   |   |   |   |
    +---+---+---+---+---+---+---+
  2 |   |   | O |   |   |   |   |
    +---+---+---+---+---+---+---+
  1 |   |   | X |   |   |   |   |
    +---+---+---+---+---+---+---+
      1   2   3   4   5   6   7

  Sofiane> put(1)
```

Au lancement du jeu, le programme demandera au joueur 1 de renseigner son nom.
Ses jetons seronts des `O` de couleur rouge.  
Ensuite le joueur 2 devra renseigner son nom.
Ses jetons seronts des `X` de couleur jaune.
Ensuite la partie peut débuter.  
Sous la grille un prompt invitera le joueur en cours à entrer l'une des commandes suivantes:

`Sofiane> put(1)`=> Mettre un jeton du joueur Sofiane dans la colonne 1.  
`Sofiane> rules` => Affiche la régle du jeu.  
`Sofiane> help` => Affiche la liste de toutes les commandes disponibles.  
`Sofiane> whoami` => Affiche le jeton correspondant à ce joueur.  
`Sofiane> abandon` => le joueur Sofiane abandonne l'autre joueur est déclaré vainqueur.

La partie se terminera lorsqu'un joueur alignera 4 jetons (horizontalement, verticalement, ou en diagonale)
