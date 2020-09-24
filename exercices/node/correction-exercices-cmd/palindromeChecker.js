if (process.argv.length !== 3) {
  console.log('usage: node palindromeChecker.js word')
  process.exit(1)
}

let word = process.argv[2]
if (word === word.split('').reverse().join('')) {
  console.log(`${word} is a palindrome`)
} else {
  console.log(`${word} is not a palindrome`)
}
