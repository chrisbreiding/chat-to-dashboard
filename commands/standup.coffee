_ = require 'lodash'

module.exports =

  name: 'standup'
  desc: 'Trigger standup, make standup URL fullscreen for duration'
  args: [
    name: 'duration'
    required: 'optional'
    desc: 'Duration of standup in minutes'
    default: 10
  ]

  response: (duration)->
    duration = 10 if _.isNaN Number(duration)

    event: @name
    data: duration: duration
    message: "ALL RISE! Commence standup for #{duration} minutes."
