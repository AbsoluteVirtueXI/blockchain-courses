// Vous devez assigner la bonne string à la variable password ci dessous
// Et obtenir le message 'OK' en éxecutant le programme
let password = ''

const crackme1 = (password) => {
  if (password === 'password1234') {
    console.log('GOOD')
  } else {
    console.log('BAD')
  }
}

crackme1(password)
