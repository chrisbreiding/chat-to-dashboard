_ = require 'lodash'

module.exports =

  desc: """
        /board text "[text]"
          Display an text
          Args:
            text (required) - The text to display, must be in quotes (single or double)
            duration (optional) - How long to display the text in seconds - default: 30
        """

  response: (argText)->
    try
      [ignore, ignore2, text, duration] = argText.match /(['"])(.*)\1\s*(\d+)?/
    catch e
      return message: 'The text command you attempted was not formatted correctly. Try: /board text "[text]"'

    unless text
      return message: 'You must send the text (in quotes) to display. Try: /board text "[text]"'

    duration = 30 if _.isNaN Number(duration)

    event: 'text'
    data:
      text: text
      duration: duration
    message: "Displaying text for #{duration} seconds..."
