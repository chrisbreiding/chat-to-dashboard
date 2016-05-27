command =
  name: 'share'
  desc: 'Start a video call'
  args: [
    name: 'end'
    required: 'optional'
    desc: 'Include to end the current call (`board share end`)'
  ]

  response: (argString, username)->
    shouldEnd = argString is 'end'

    event: command.name
    message: if shouldEnd then null else "Sharing at http://appear.in/cypress"
    data:
      end: shouldEnd

module.exports = command
