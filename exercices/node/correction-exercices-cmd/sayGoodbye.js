if (process.argv.length !== 3) {
  console.log('usage: node sayGoodbye.js name')
  process.exit(1)
}
console.log(`Goodbye, ${process.argv[2]}`)
