const count = (min, max, step) => {
  for (let i = min; i <= max; i += step) {
    console.log(i)
  }
}

count(0, 100, 1)
console.log('###############################')
count(15, 15000, 100)
console.log('###############################')
count(100, 150, 3)
