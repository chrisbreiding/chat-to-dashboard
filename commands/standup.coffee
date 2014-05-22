_ = require 'lodash'

module.exports =

  desc: """
        *board standup [duration]*
        Trigger standup, make standup URL fullscreen for duration
        Args:
            _duration_ (optional) Duration of standup in minutes - default: 10
        """

  response: (duration)->
    duration = 10 if _.isNaN Number(duration)

    event: 'standup'
    data: duration: duration
    message: "ALL RISE! Commence standup for #{duration} minutes."
