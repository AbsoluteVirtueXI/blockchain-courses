import fs from 'fs/promises'
import path from 'path' // for making easy path manipulation

if (process.argv.length != 3) {
  console.log('usage: showDirFiles.js directory')
  process.exit(1)
}

try {
  let dir = process.argv[2]
  let stats = await fs.stat(dir)
  if (!stats.isDirectory()) {
    console.log(`Error: ${dir} is not a directory`)
    process.exit(1)
  }

  let dirList = await fs.readdir(dir)
  let files = []
  // check if entries in dirList are files
  // if it is a file concatenate the directory path to the file
  for (const elem of dirList) {
    if ((await fs.stat(path.join(dir, elem))).isFile()) {
      files.push(path.join(dir, elem))
    }
  }
  for (const file of files) {
    let content = await fs.readFile(file, 'utf-8')
    console.log(`
################################
${file}:\n
################################\n
${content}`)
  }
} catch (e) {
  console.error(e)
}
