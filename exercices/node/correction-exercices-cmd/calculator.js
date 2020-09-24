const add = (nb1, nb2) => {
  return nb1 + nb2
}

const sub = (nb1, nb2) => {
  return nb1 - nb2
}

const mul = (nb1, nb2) => {
  return nb1 * nb2
}

const div = (nb1, nb2) => {
  return nb1 / nb2
}

const calc = (op, nb1, nb2) => {
  switch (op) {
    case '+':
      return add(nb1, nb2)
    case '-':
      return sub(nb1, nb2)
    case '*':
      return mul(nb1, nb2)
    case '/':
      return div(nb1, nb2)
    default:
      console.log('Error: Unknown operator')
  }
}

if (process.argv.length !== 5) {
  console.log('usage: node calculator.js op nb1 nb2')
  process.exit(1)
}
if (
  process.argv[2] !== '+' &&
  process.argv[2] !== '-' &&
  process.argv[2] !== '*' &&
  process.argv[2] !== '/'
) {
  console.log(`Error: unknown operator ${process.argv[2]}`)
  process.exit(1)
}

if (isNaN(process.argv[3]) || isNaN(process.argv[4])) {
  console.log(`Error: please pass numbers to program`)
  process.exit(1)
}

let op = process.argv[2]
let nb1 = Number(process.argv[3])
let nb2 = Number(process.argv[4])

console.log(calc(op, nb1, nb2))
