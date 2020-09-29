import fs from 'fs/promises'

if (process.argv.length !== 4) {
  console.log('usage: promiseCopyandOptionnel.js src dst')
  process.exit(1)
}

let src = process.argv[2]
let dst = process.argv[3]

try {
  let stats = await fs.stat(`${src}`)
  if (stats.isFile()) {
    let content = await fs.readFile(`${src}`)
    await fs.writeFile(`${dst}`, content)
  } else {
    console.log(`Error: ${src} is not a file.`)
  }
} catch (e) {
  console.error(e)
}
