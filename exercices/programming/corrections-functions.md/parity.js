const isOdd = (nb) => {
  /*
  if (nb % 2 !== 0) {
    return true
  } else {
    return false
  }
  */
  return nb % 2 !== 0
}

const isEven = (nb) => {
  return !isOdd(nb)
}

console.log(isOdd(1)) // true
console.log(isOdd(10)) // false
console.log(isEven(1)) // false
console.log(isEven(10)) // true
