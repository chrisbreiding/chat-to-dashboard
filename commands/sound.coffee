_ = require 'lodash'

sounds =
  buzzer: 'http://soundfxnow.com/soundfx/FamilyFeud-Buzzer3.mp3'
  crickets: 'http://soundfxnow.com/soundfx/Crickets.mp3'
  ding: 'http://soundfxnow.com/soundfx/GameshowBellDing2.mp3'
  drama: 'http://soundfxnow.com/soundfx/DramaScore.mp3'
  fail: 'http://soundfxnow.com/soundfx/Sad-Trombone.mp3'
  ping: 'http://rpg.hamsterrepublic.com/wiki-images/1/12/Ping-da-ding-ding-ding.ogg'
  trumpet: 'http://soundfxnow.com/soundfx/MilitaryTrumpetTune1.mp3'

module.exports =

  desc: """
        /board sound [sound]
          Play a sound
          Args:
            sound (required) - URL or an alias for the sound
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
