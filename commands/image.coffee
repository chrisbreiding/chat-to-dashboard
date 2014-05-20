module.exports =

  desc: """
        /board image [url]
        Args:
          url (required) - URL for the image
        """

  response: (url)->
    unless url
      return message: 'You must send the url of the image to display. Try: /board image [url]'

    event: 'image'
    data: url: url
    message: "Displaying image at url '#{url}'..."
