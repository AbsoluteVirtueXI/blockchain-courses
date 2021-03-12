const numberPyramid = (nb) => {
  for (let i = 1; i <= nb; ++i) {
    console.log(`${i}`.repeat(i))
  }
}

numberPyramid(5)
numberPyramid(8)
