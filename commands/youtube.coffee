module.exports =

  desc: """
        *board youtube [id]*
        Play a YouTube video
        Args:
            _id_ (required) YouTube video ID
        """

  response: (id)->
    unless id
      return message: 'You must include the id of the YouTube video. Try: `board youtube [id]`'

    event: 'youtube'
    data: id: id
    message: "Playing Youtube video..."
