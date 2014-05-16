_ = require 'lodash'
express = require 'express'
bodyParser = require 'body-parser'
Pusher = require 'pusher'

app = express()
pusher = new Pusher
  appId: process.env.PUSHER_APP_ID
  key: process.env.PUSHER_KEY
  secret: process.env.PUSHER_SECRET

app.use bodyParser()

commands =
  standup: (duration)->
    duration = 10 if _.isNaN Number(duration)

    event: 'standup'
    data: duration: duration
    response: "ALL RISE! Commence standup for #{duration} minutes."
  commands: ->
    availableCommands = ("  /board #{command}" for command of commands).join '\n'

    response: "Available commands:\n#{availableCommands}"

unknownCommand = ->
  response: "Unknown command sent. #{commands.commands().response}"

determineCommand = (text)->
  [command, args...] = text.split ' '
  if typeof commands[command] is 'function'
    commands[command] args...
  else
    unknownCommand()

app.post '/board', (req, res)->
  if req.body.token isnt process.env.SLACK_BOARD_TOKEN
    return res.send 403

  command = determineCommand req.body.text
  if command.event
    pusher.trigger req.body.channel_name, command.event, command.data
  res.send 200, command.response

port = process.env.PORT || 5000
app.listen port, ->
  console.log "listening on #{port}..."
