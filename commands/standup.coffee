_ = require 'lodash'

command =

  name: 'standup'
  desc: 'Trigger standup, make standup URL fullscreen for duration'
  args: [
    name: 'duration'
    required: 'optional'
    desc: 'Duration of standup in minutes'
    default: 10
  ]

  response: (duration)->
    duration = 10 if _.isNaN parseInt(duration, 10)

    event: 'standup'
    data: duration: duration
    message: "ALL RISE! Commence standup for #{duration} minutes."

module.exports = command
