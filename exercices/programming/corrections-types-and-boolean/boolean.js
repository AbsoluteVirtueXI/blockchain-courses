let res1 = (true && false) || (false && true)
let res2 = 10 > 11 && 11 > 10
let res3 = (true || false) && true
let res4 = (!true && !false) || (!false && !false)
let res5 = 'Hello' === 'Hello' && 'World' == 'Word'
let res6 = (!(20 >= 20) && 7 === 7) || true
let res7 = '1' === 1 && '2' == 2 && '3' === 3
let res8 = !res7
let res9 = !res8
let res10 =
  (res1 && res2) || (res3 && res4) || (res5 && res6) || (res7 && res8 && res9)

console.log(res1)
console.log(res2)
console.log(res3)
console.log(res4)
console.log(res5)
console.log(res6)
console.log(res7)
console.log(res8)
console.log(res9)
console.log(res10)
