import fs from 'fs'

try {
  let content = fs.readFileSync('file1.txt', 'utf-8')
  fs.writeFileSync('file2.txt', content)
} catch (e) {
  console.error(e)
}
