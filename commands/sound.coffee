_ = require 'lodash'
format = require '../help-formatter'
deSlack = require '../de-slack'

command =
  name: 'sound'
  desc: 'Play a sound'
  args: [
    name: 'sound'
    required: 'required'
    desc: 'URL or an alias for the sound'
  ]
  aliases: 'buzzer ding drama fail ping trumpet'.split(' ')

  response: (argString)->
    sound = argString
    unless sound
      suggestion = format(command).suggestion()
      return message: "You must include the url or alias of the sound to play. #{suggestion}"

    event: 'sound'
    data: sound: deSlack.url sound

module.exports = command
