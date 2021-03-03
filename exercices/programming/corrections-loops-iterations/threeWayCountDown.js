const MIN = 1
const MAX = 101
const STEP = 2

// V1
for (let i = MAX; i >= MIN; i -= STEP) {
  console.log(i)
}

// V2
let i = MAX
while (i >= MIN) {
  console.log(i)
  i -= STEP
}

// V3
i = MAX
do {
  console.log(i)
  i -= STEP
} while (i >= MIN)
