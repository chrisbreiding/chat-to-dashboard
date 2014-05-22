_ = require 'lodash'

module.exports =

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

  response: (argText)->
    suggestion = format(this).suggestion()
    try
      [ignore, ignore2, text, duration] = argText.match /(['"])(.*)\1\s*(\d+)?/
    catch e
      return message: "The text command attempted was not formatted correctly. #{suggestion}"

    unless text
      return message: "You must include the text (in quotes) to display. #{suggestion}"

    duration = 30 if _.isNaN Number(duration)

    event: @name
    data:
      text: text
      duration: duration
    message: "Displaying text for #{duration} seconds..."
