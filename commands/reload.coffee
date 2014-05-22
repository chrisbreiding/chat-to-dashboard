command =

  name: 'reload'
  desc: 'Reload the board'

  response: ->
    event: 'reload'
    message: 'Reloading board...'

module.exports = command
