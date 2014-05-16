commands =

  standup: (duration)->
    duration = 10 if _.isNaN Number(duration)

    event: 'standup'
    data: duration: duration
    response: "ALL RISE! Commence standup for #{duration} minutes."

  reload: ->
    event: 'reload'
    response: 'Reload command sent.'

  youtube: (id)->
    event: 'youtube'
    data: id: id
    response: "Youtube video with id '#{id}' sent to board."

  sound: (url)->
    event: 'sound'
    data: url: url
    response: "Sound at url '#{url}' send to play on board."

  commands: ->
    self = this
    availableCommands = ("  /board #{command}" for own command of commands when command isnt 'unknown').join '\n'

    response: "Available commands:\n#{availableCommands}"

  unknown: ->
    response: "Unknown command sent. #{commands.commands().response}"

module.exports = commands
