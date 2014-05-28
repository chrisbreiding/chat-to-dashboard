_ = require 'lodash'
format = require '../help-formatter'
deSlack = require '../de-slack'

command =

  name: 'text'
  desc: 'Display some text'
  args: [
    name: 'text'
    required: 'required'
    desc: 'The text to display, must be in quotes (single or double)'
    quoted: true
  ,
    name: 'duration'
    required: 'optional'
    desc: 'How long to display the text in seconds'
    default: 30
  ]

  response: (argString, username)->
    suggestion = format(command).suggestion()
    try
      [ignore, ignore2, text, duration] = argString.match /(['"])(.*)\1\s*(\d+)?/
    catch e
      return message: "The text command attempted was not formatted correctly. #{suggestion}"

    unless text
      return message: "You must include the text (in quotes) to display. #{suggestion}"

    duration = 30 if _.isNaN parseInt(duration, 10)

    event: 'text'
    data:
      text: deSlack.text text
      sender: user_name
      duration: duration

module.exports = command
