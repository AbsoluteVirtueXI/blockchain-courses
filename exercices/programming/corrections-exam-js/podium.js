const podium = (tab) => {
  let top3 = scores
    .sort((a, b) => {
      return b - a
    })
    .slice(0, 3)
  console.log(`1st: ${top3[0]}`)
  console.log(`2nd: ${top3[1]}`)
  console.log(`3rd: ${top3[2]}`)
}

let scores = [1, 10, 56, 9, 45, 0, 11, 4]
podium(scores)
