_ = require 'lodash'

getArgs = (fn)->
  matches = fn.toString().match /^function\s*\((.*)\)/
  _.map matches[1].split(','), (arg)-> arg.trim()

availableCommands = ->
  for own type, command of commands when type isnt 'unknown'
    args = getArgs(command)
    args = if args.length and not _.isEmpty args[0]
      _.map(args, (arg)-> "[#{arg}]").join(' ')
    else
      ''
    "  /board #{type} #{args}"

commands =

  standup: (duration)->
    duration = 10 if _.isNaN Number(duration)

    event: 'standup'
    data: duration: duration
    response: "ALL RISE! Commence standup for #{duration} minutes."

  reload: ->
    event: 'reload'
    response: 'Reloading board...'

  youtube: (id)->
    unless id
      return response: 'You must send an id to play a youtube video. Try: /board youtube [id]'

    event: 'youtube'
    data: id: id
    response: "Playing Youtube video with id '#{id}'..."

  sound: (url)->
    unless url
      return response: 'You must send a url with a sound to play it. Try: /board sound [url]'

    event: 'sound'
    data: url: url
    response: "Playing sound at url '#{url}'..."

  list: ->
    response: "Available commands:\n#{availableCommands().join('\n')}"

  unknown: ->
    response: "Unknown command sent. #{commands.list().response}"

module.exports = commands
