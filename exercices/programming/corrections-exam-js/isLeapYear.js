const isLeapYear = (year) => {
  if (year % 4 === 0 && year % 100 !== 0) {
    return true
  } else if (year % 400 === 0) {
    return true
  } else {
    return false
  }
}

console.log(isLeapYear(400)) // output: true
console.log(isLeapYear(2000)) // output: true
console.log(isLeapYear(2002)) // output: false
console.log(isLeapYear(2004)) // output: true
console.log(isLeapYear(2020)) // output: true
console.log(isLeapYear(2021)) // output: false
