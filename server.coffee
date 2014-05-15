express = require 'express'
bodyParser = require 'body-parser'
Pusher = require 'pusher'

app = express()
pusher = new Pusher
  appId: process.env.PUSHER_APP_ID
  key: process.env.PUSHER_KEY
  secret: process.env.PUSHER_SECRET

app.use bodyParser()

app.post '/standup', (req, res)->
  if req.body.token isnt process.env.STANDUP_TOKEN
    return res.send 403
  pusher.trigger req.body.channel_name, 'standup'
  res.send 200, 'Standup triggered'

port = process.env.PORT || 5000
app.listen port, ->
  console.log "listening on #{port}..."
