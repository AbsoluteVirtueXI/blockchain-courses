import axios from 'axios'

let data = await Promise.race([
  axios.get('https://www.facebook.com').then(() => 'facebook'),
  axios.get('https://www.amazon.com').then(() => 'amazon'),
  axios.get('https://www.apple.com').then(() => 'apple'),
  axios.get('https://www.google.com').then(() => 'google'),
]).catch((err) => {
  console.error(err)
})
console.log(data)
