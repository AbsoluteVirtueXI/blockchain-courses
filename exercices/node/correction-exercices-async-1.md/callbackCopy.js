import fs from 'fs'

fs.readFile('file1.txt', 'utf-8', (error, data) => {
  if (error) console.error(error)
  else
    fs.writeFile('file2.txt', data, (error) => {
      if (error) console.error(error)
    })
})
