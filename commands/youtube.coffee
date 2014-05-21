module.exports =

  desc: """
        /board youtube [id]
          Play a YouTube video
          Args:
            id (required) - YouTube video ID
        """

  response: (id)->
    unless id
      return message: 'You must send an id to play a youtube video. Try: /board youtube [id]'

    event: 'youtube'
    data: id: id
    message: "Playing Youtube video with id '#{id}'..."
