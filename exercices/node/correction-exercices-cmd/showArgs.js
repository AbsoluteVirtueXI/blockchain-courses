if (process.argv.length <= 2) {
  console.log('Error: not enough arguments.')
  process.exit(1)
}

process.argv
  .slice(2)
  .reverse()
  .forEach((elem) => console.log(elem))
