module.exports =

  name: 'youtube'
  desc: 'Play a YouTube video'
  args: [
    name: 'id'
    required: 'required'
    desc: 'YouTube video ID'
  ]

  response: (id)->
    unless id
      suggestion = format(this).suggestion()
      return message: "You must include the id of the YouTube video. #{suggestion}"

    event: @name
    data: id: id
    message: "Playing Youtube video..."
