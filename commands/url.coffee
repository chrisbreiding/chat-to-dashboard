_ = require 'lodash'

module.exports =

  desc: """
        *board url [url] [duration]*
        Display a web page
        Args:
            _url_ (required) URL of web page to display
            _duration_ (optional) How long to display the web page in seconds - default: 30
        """

  response: (argText)->
    [url, duration] = argText.split /\s+/

    unless url
      return message: 'You must include the url of the web page to display. Try: `board url [url]`'

    duration = 30 if _.isNaN Number(duration)

    event: 'url'
    data:
      url: url
      duration: duration
    message: "Displaying web page for #{duration} seconds..."
