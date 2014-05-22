express = require 'express'
bodyParser = require 'body-parser'
Pusher = require 'pusher'
_ = require 'lodash'
getCommand = require './command'

app = express()
pusher = new Pusher
  appId: process.env.PUSHER_APP_ID
  key: process.env.PUSHER_KEY
  secret: process.env.PUSHER_SECRET

app.use bodyParser()

app.post '/board', (req, res)->
  if req.body.token isnt process.env.SLACK_BOARD_TOKEN
    return res.send 403

  command = getCommand req.body.text, req.body.user_name
  if command.event
    pusher.trigger req.body.channel_name, command.event, (command.data || {})

  if command.message
    response =
      text: command.message

  res.send 200, response

port = process.env.PORT || 5000
app.listen port, ->
  console.log "listening on #{port}..."
