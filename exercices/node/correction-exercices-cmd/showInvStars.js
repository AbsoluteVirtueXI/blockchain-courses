const showStars = (nbStars) => {
  for (let i = nbStars; i > 0; i -= 1) {
    console.log('*'.repeat(i))
  }
}

if (process.argv.length !== 3) {
  console.log('usage: node showInvStars.js nb')
  process.exit(1)
}

if (isNaN(process.argv[2])) {
  console.log(`Error: ${process.argv[2]} is not a number`)
  process.exit(1)
}

let nbStars = Number(process.argv[2])
showStars(nbStars)
