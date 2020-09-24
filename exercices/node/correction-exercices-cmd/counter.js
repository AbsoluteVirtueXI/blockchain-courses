const count = (min, max, step) => {
  for (let i = min; i <= max; i += step) {
    console.log(i)
  }
}

if (process.argv.length !== 5) {
  console.log('usage: node counter.js min max step')
  process.exit(1)
}

if (
  isNaN(process.argv[2]) ||
  isNaN(process.argv[3]) ||
  isNaN(process.argv[4])
) {
  console.log('Error: min max and step must be a number.')
  process.exit(1)
}

let min = Number(process.argv[2])
let max = Number(process.argv[3])
let step = Number(process.argv[4])

count(min, max, step)
