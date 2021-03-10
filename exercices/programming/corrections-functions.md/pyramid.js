// Déclaration de showStars.
// nbBase est un entier correspondant au nombre d'étoile de la base de notre pyramide
// reverse est un boolean. Si reverse === true alors afficher la pyramide à l'envers
// showStars ne retourne aucune valeur
const showStars = (nbBase, reverse, str) => {
  if (!reverse) {
    for (let i = 1; i <= nbBase; ++i) {
      console.log(str.repeat(i))
    }
  } else {
    for (let i = nbBase; i >= 1; --i) {
      console.log(str.repeat(i))
    }
  }
}

// Appel de la fonction showStars avec l'argument 5 et true
showStars(5, true, '^')

// Appel de la fonction showStars avec l'argument 10 et false
showStars(10, false, '$')

const nbBase = 15
// Appel de la fonction showStars avec l'argument nbBase qui est égal a 15 et true
showStars(nbBase, true, '¥')
