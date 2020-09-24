if (process.argv.length !== 3) {
  console.log('usage: node oddTest.js nb')
  process.exit(1)
}

if (isNaN(process.argv[2])) {
  console.log(`Error: ${process.argv[2]} is not a number`)
  process.exit(1)
}

let nb = Number(process.argv[2])

console.log(nb % 2 === 0 ? `${nb} est pair` : `${nb} est impair`)
