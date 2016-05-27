_ = require 'lodash'
format = require '../help-formatter'
deSlack = require '../de-slack'

command =

  name: 'image'
  desc: 'Display an image'
  args: [
    name: 'url'
    required: 'required'
    desc: 'URL for the image'
  ,
    name: 'duration'
    required: 'optional'
    desc: 'How long to display the image in seconds'
    default: 30
  ]

  response: (argString)->
    [url, duration] = argString.split /\s+/

    unless url
      suggestion = format(command).suggestion()
      return message: "You must include the url of the image to display. #{suggestion}"

    duration = 30 if _.isNaN parseInt(duration, 10)

    event: command.name
    data:
      url: deSlack.url url
      duration: duration

module.exports = command
