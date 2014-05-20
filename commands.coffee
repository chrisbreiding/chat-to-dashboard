_ = require 'lodash'

availableCommands = ->
  command.desc for own type, command of commands when type isnt 'unknown'

sounds =
  trumpet: 'http://soundfxnow.com/soundfx/MilitaryTrumpetTune1.mp3'
  buzzer: 'http://soundfxnow.com/soundfx/FamilyFeud-Buzzer3.mp3'
  ping: 'http://rpg.hamsterrepublic.com/wiki-images/1/12/Ping-da-ding-ding-ding.ogg'
  ding: 'http://soundfxnow.com/soundfx/GameshowBellDing2.mp3'
  fail: 'http://soundfxnow.com/soundfx/Sad-Trombone.mp3'
  crickets: 'http://soundfxnow.com/soundfx/Crickets.mp3'
  drama: 'http://soundfxnow.com/soundfx/DramaScore.mp3'

commands =

  standup:
    desc: """
          /board standup [duration]
            Trigger standup, make standup URL fullscreen for duration
            Args:
              duration (optional) - Duration of standup in minutes - default: 10
          """
    response: (duration)->
      duration = 10 if _.isNaN Number(duration)

      event: 'standup'
      data: duration: duration
      message: "ALL RISE! Commence standup for #{duration} minutes."

  reload:
    desc: """
          /board reload
            Reload the board
          """
    response: ->
      event: 'reload'
      message: 'Reloading board...'

  youtube:
    desc: """
          /board youtube [id]
            Play YouTube video
            Args:
              id (required) - YouTube video ID
          """
    response: (id)->
      unless id
        return message: 'You must send an id to play a youtube video. Try: /board youtube [id]'

      event: 'youtube'
      data: id: id
      message: "Playing Youtube video with id '#{id}'..."

  sound:
    desc: """
          /board sound [sound]
            Play a sound
            Args:
              sound (required) - A url or an alias for a sound
            Aliases: #{_.keys(sounds).join(', ')}
          """
    response: (sound)->
      unless sound
        return message: 'You must send the url or alias of the sound to play. Try: /board sound [url|alias]'

      if sounds[sound]
        sound = sounds[sound]

      event: 'sound'
      data: url: sound
      message: "Playing sound at url '#{sound}'..."

  help:
    desc: """
          /board help
            View available commands
          """
    response: ->
      message: "Available commands:\n\n#{availableCommands().join('\n\n')}"

  unknown:
    response: ->
      message: "Unknown command sent. #{commands.help.response().message}"

module.exports = commands
