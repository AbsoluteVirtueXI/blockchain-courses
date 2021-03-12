const information = (first, name, age) => {
  console.log(`prenom: ${first}`)
  console.log(`nom: ${name}`)
  console.log(`age: ${age}`)
  if (age >= 18) {
    console.log(`vous êtes majeur depuis ${age - 18} ans`)
  } else {
    console.log(`vous serez majeur dans ${18 - age} ans`)
  }
}

information('Sofiane', 'Akermoun', 39)
information('Alice', 'Liddell', 7)
