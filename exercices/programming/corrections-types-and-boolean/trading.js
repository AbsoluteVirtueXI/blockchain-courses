let prixDuBTC = 50000 // Prix du BTC en dollars
let prixPourVendre = 60000
let prixPourAcheter = 45000

if (prixDuBTC <= prixPourAcheter) {
  console.log('Acheter du BTC')
} else if (prixDuBTC >= prixPourVendre) {
  console.log('Vendre du BTC')
} else {
  console.log('Attendre')
}

console.log('Programme terminée')
