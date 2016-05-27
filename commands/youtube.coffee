format = require '../help-formatter'

command =

  name: 'youtube'
  desc: 'Play a YouTube video'
  args: [
    name: 'id'
    required: 'required'
    desc: 'YouTube video ID'
  ]

  response: (argString)->
    id = argString
    unless id
      suggestion = format(command).suggestion()
      return message: "You must include the id of the YouTube video. #{suggestion}"

    event: command.name
    data: id: id

module.exports = command
