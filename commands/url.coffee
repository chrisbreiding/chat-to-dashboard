_ = require 'lodash'

module.exports =

  desc: """
        /board url [url]
          Display a web page
          Args:
            url (required) - URL of web page to display
            duration (optional) - How long to display the web page in seconds - default: 30
        """

  response: (argText)->
    [url, duration] = argText.split /\s+/

    unless url
      return message: 'You must send the url of the web page to display. Try: /board url [url]'

    duration = 30 if _.isNaN Number(duration)

    event: 'url'
    data:
      url: url
      duration: duration
    message: "Displaying web page for #{duration} seconds..."
