command =

  name: 'reload'
  desc: 'Reload the board'

  response: ->
    event: @name
    message: 'Reloading board...'

module.exports = command
