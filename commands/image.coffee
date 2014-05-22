_ = require 'lodash'
format = require '../help-formatter'

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

  response: (argText)->
    [url, duration] = argText.split /\s+/

    unless url
      suggestion = format(command).suggestion()
      return message: "You must include the url of the image to display. #{suggestion}"

    duration = 30 if _.isNaN Number(duration)

    event: 'image'
    data:
      url: url
      duration: duration
    message: "Displaying image for #{duration} seconds..."

module.exports = command
