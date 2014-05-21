_ = require 'lodash'

module.exports =

  desc: """
        /board image [url]
          Display an image
          Args:
            url (required) - URL for the image
            duration (optional) - How long to display the image in seconds - default: 30
        """

  response: (argText)->
    [url, duration] = argText.split /\s+/

    unless url
      return message: 'You must send the url of the image to display. Try: /board image [url]'

    duration = 30 if _.isNaN Number(duration)

    event: 'image'
    data:
      url: url
      duration: duration
    message: "Displaying image at url '#{url}' for #{duration} seconds..."
