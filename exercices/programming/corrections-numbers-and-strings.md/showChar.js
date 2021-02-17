let str = "C'était à Mégara, faubourg de Carthage, dans les jardins d'Hamilcar."
console.log(str)
console.log(`nb char: ${str.length}`)
console.log('Livre: Salammbô')
console.log(`Auteur: Gustave Flaubert`)

for (let index = 0; index < str.length; ++index) {
  console.log(`Le caractère ${str[index]} est à l'index ${index}`)
}
