command =
  name: 'share'
  desc: 'Start a video call'
  args: [
    name: 'end'
    required: 'optional'
    desc: 'Include to end the current call (`board share end`)'
  ]

  response: (argString, username)->
    event: command.name
    data:
      end: argString is 'end'

module.exports = command
