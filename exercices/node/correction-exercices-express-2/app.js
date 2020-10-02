import express from 'express'
import { calc } from './calc.js'

const app = express()

const IP_LOCAL = '192.168.0.11'
const PORT = 7777

const sendMessage = (req, res) => {
  res.send(req.message)
}

const wrapWithHtml = (req, res, next) => {
  const html = `
<!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <title>Exercices express 2</title>
      </head>
    
      <body>
        <p>${req.message}</p>
      </body>
    </html>
`
  req.message = html
  next()
}

app.get('/', (req, res, next) => {
  req.message = `Exercices express partie 2`
  next()
})

app.get('/get_current_time', (req, res, next) => {
  const date = new Date().toUTCString()
  req.message = date
  next()
})

app.get('/how_pass_data', (req, res, next) => {
  const msg =
    'On peut passer des données entre les middleware grâce aux obj req, res'
  req.message = msg
  next()
})

app.use('/calc', calc)

app.use(wrapWithHtml)
app.use(sendMessage)
// start the server
app.listen(PORT, IP_LOCAL, () => {
  console.log(`listening at ${IP_LOCAL}:${PORT}`)
})
