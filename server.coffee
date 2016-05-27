express = require 'express'
bodyParser = require 'body-parser'
_ = require 'lodash'
executeCommand = require './execute-command'

app = express()
app.use bodyParser.urlencoded(extended: false)
app.use bodyParser.json()

app.post '/board', (req, res)->
  if req.body.token isnt process.env.SLACK_BOARD_TOKEN
    return res.send 403

  message = executeCommand _.clone(req.body, true)
  if message
    response = text: message

  res.send 200, response

port = process.env.PORT || 5000
app.listen port, ->
  console.log "listening on #{port}..."
