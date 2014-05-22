_ = require 'lodash'
format = require '../help-formatter'
deSlack = require '../de-slack'

command =

  name: 'url'
  desc: 'Display a web page'
  args: [
    name: 'url'
    required: 'required'
    desc: 'URL of web page to display'
  ,
    name: 'duration'
    required: 'optional'
    desc: 'How long to display the web page in seconds'
    default: 30
  ]

  response: (argText)->
    [url, duration] = argText.split /\s+/

    unless url
      suggestion = format(command).suggestion()
      return message: "You must include the url of the web page to display. #{suggestion}"

    duration = 30 if _.isNaN parseInt(duration, 10)

    event: 'url'
    data:
      url: deSlack.url url
      duration: duration

module.exports = command
