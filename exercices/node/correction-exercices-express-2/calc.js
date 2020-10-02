import express from 'express'

export const calc = express.Router()
calc.get('/:op/:nb1/:nb2', (req, res, next) => {
  const op = req.params.op
  // TODO verifier que c'est pas isNan
  const nb1 = Number(req.params.nb1)
  const nb2 = Number(req.params.nb2)
  switch (op.toLowerCase()) {
    case 'add':
      req.message = nb1 + nb2
      break
    case 'sub':
      req.message = nb1 - nb2
      break
    case 'mul':
      req.message = nb1 * nb2
      break
    case 'div':
      req.message = nb1 / nb2
      break
    default:
      req.message = 'mauvais opérateur ou nombres'
  }

  next()
})
