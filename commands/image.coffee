_ = require 'lodash'

module.exports =

  desc: """
        *board image [url] [duration]*
        Display an image
        Args:
            _url_ (required) URL for the image
            _duration_ (optional) How long to display the image in seconds - default: 30
        """

  response: (argText)->
    [url, duration] = argText.split /\s+/

    unless url
      return message: 'You must include the url of the image to display. Try: `board image [url]`'

    duration = 30 if _.isNaN Number(duration)

    event: 'image'
    data:
      url: url
      duration: duration
    message: "Displaying image for #{duration} seconds..."
