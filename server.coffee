_ = require 'lodash'
express = require 'express'
bodyParser = require 'body-parser'
Pusher = require 'pusher'
commands = require './commands'

app = express()
pusher = new Pusher
  appId: process.env.PUSHER_APP_ID
  key: process.env.PUSHER_KEY
  secret: process.env.PUSHER_SECRET

app.use bodyParser()

getCommand = (text)->
  [type, args...] = text.split ' '
  command = commands[type]
  unless typeof command is 'function'
    command = commands.unknown
  command args...

app.post '/board', (req, res)->
  if req.body.token isnt process.env.SLACK_BOARD_TOKEN
    return res.send 403

  command = getCommand req.body.text
  if command.event
    pusher.trigger req.body.channel_name, command.event, command.data
  res.send 200, command.response

port = process.env.PORT || 5000
app.listen port, ->
  console.log "listening on #{port}..."
