_ = require 'lodash'
format = require '../help-formatter'
deSlack = require '../de-slack'

sounds =
  buzzer: 'http://soundfxnow.com/soundfx/FamilyFeud-Buzzer3.mp3'
  crickets: 'http://soundfxnow.com/soundfx/Crickets.mp3'
  ding: 'http://soundfxnow.com/soundfx/GameshowBellDing2.mp3'
  drama: 'http://soundfxnow.com/soundfx/DramaScore.mp3'
  fail: 'http://soundfxnow.com/soundfx/Sad-Trombone.mp3'
  ping: 'http://rpg.hamsterrepublic.com/wiki-images/1/12/Ping-da-ding-ding-ding.ogg'
  trumpet: 'http://soundfxnow.com/soundfx/MilitaryTrumpetTune1.mp3'

command =

  name: 'sound'
  desc: 'Play a sound'
  args: [
    name: 'sound'
    required: 'required'
    desc: 'URL or an alias for the sound'
  ]
  aliases: _.keys sounds

  response: (sound)->
    unless sound
      suggestion = format(command).suggestion()
      return message: "You must include the url or alias of the sound to play. #{suggestion}"

    if sounds[sound]
      sound = sounds[sound]

    event: 'sound'
    data: url: deSlack.url sound
    message: "Playing sound..."

module.exports = command
