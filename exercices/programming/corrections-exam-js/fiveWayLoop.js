const tab = ['Alice', 'Bob', 'Charlie', 'Dan', 'Eve']

// V1
for (let i = 0; i < tab.length; ++i) {
  console.log(`${tab[i]}, length: ${tab[i].length}`)
}

// V2
for (const elem of tab) {
  console.log(`${elem}, length: ${elem.length}`)
}

// V3
tab.forEach((elem) => {
  console.log(`${elem}, length: ${elem.length}`)
})

// V4
let index = 0
while (index < tab.length) {
  console.log(`${tab[index]}, length: ${tab[index].length}`)
  ++index
}

// V5
index = 0
do {
  console.log(`${tab[index]}, length: ${tab[index].length}`)
  ++index
} while (index < tab.length)
