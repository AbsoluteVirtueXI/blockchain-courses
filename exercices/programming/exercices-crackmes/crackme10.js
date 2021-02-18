// Vous devez assigner la bonne string à la variable password ci dessous
// Et obtenir le message 'OK' en éxecutant le programme
let password = ''

const crackme10 = (password) => {
  if (
    password
      .trim()
      .toLowerCase()
      .split('')
      .filter((elem) => ['a', 'e', 'i', 'o', 'u', 'y'].includes(elem))
      .map((elem) => elem.charCodeAt())
      .reduce((a, b) => {
        return a + b
      }, 0) %
      2 !==
    0
  ) {
    console.log('OK')
  } else {
    console.log('BAD')
  }
}

crackme10(password)
