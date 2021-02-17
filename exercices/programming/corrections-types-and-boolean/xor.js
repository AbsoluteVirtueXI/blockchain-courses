let a = true
let b = true

// V1
if ((a || b) && !(a && b)) {
  console.log('V1: TRUE')
} else {
  console.log('V1: FALSE')
}
// V2
if ((a && !b) || (!a && b)) {
  console.log('V2: TRUE')
} else {
  console.log('V2: FALSE')
}
