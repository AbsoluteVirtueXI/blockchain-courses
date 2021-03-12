const isMagicSquare = (square) => {
  let d1Sum = 0 // sum of first diagonal
  for (let i = 0; i < square.length; ++i) {
    d1Sum += square[i][i]
  }

  let d2Sum = 0 // sum of second diagonal
  for (let i = square.length - 1; i >= 0; --i) {
    d2Sum += square[i][i]
  }

  if (d1Sum !== d2Sum) {
    return false
  }

  // check all row sum and compare each to d1Sum
  for (let i = 0; i < square.length; ++i) {
    let rowSum = 0
    for (let j = 0; j < square.length; ++j) {
      rowSum += square[i][j]
    }
    if (rowSum !== d1Sum) {
      return false
    }
  }

  // check all column sum and compare each to d1Sum
  for (let i = 0; i < square.length; ++i) {
    let colSum = 0
    for (let j = 0; j < square.length; ++j) {
      colSum += square[j][i]
    }
    if (colSum !== d1Sum) {
      return false
    }
  }

  // we didn't return false yet so it is a magic square
  return true
}

// magic square
const square1 = [
  [2, 7, 6],
  [9, 5, 1],
  [4, 3, 8],
]

// not a magic square
const square2 = [
  [2, 7, 6, 1],
  [9, 5, 1, 6],
  [4, 3, 8, 3],
  [1, 1, 1, 1],
]

// magic square
const square3 = [
  [17, 24, 1, 8, 15],
  [23, 5, 7, 14, 16],
  [4, 6, 13, 20, 22],
  [10, 12, 19, 21, 3],
  [11, 18, 25, 2, 9],
]

// not magic square
const square4 = [
  [11, 24, 1, 8, 15],
  [23, 5, 7, 14, 1],
  [4, 6, 6, 20, 22],
  [10, 12, 19, 21, 7],
  [11, 18, 25, 2, 9],
]

console.log(isMagicSquare(square1)) // output: true
console.log(isMagicSquare(square2)) // output: false
console.log(isMagicSquare(square3)) // output: true
console.log(isMagicSquare(square4)) // output: false
