const showStars = (nbStars) => {
  for (let i = 1; i <= nbStars; i += 1) {
    console.log('*'.repeat(i))
  }
}

showStars(10)
