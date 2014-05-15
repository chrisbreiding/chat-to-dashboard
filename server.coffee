express = require 'express'
bodyParser = require 'body-parser'
Pusher = require 'pusher'

app = express()

app.use bodyParser()

port = process.env.PORT || 5000
app.listen port, ->
  console.log "listening on #{port}..."
