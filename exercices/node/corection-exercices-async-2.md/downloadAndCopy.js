import fs from 'fs/promises'
import axios from 'axios'

if (process.argv.length !== 4) {
  console.log(`usage: node downloadAndCopy.js url file`)
  process.exit(1)
}

try {
  let url = process.argv[2]
  let file = process.argv[3]
  let response = await axios.get(url)
  let content = response.data
  await fs.writeFile(file, content)
} catch (e) {
  console.error(e)
}
