module.exports =

  name: 'reload'
  desc: 'Reload the board'

  response: ->
    event: @name
    message: 'Reloading board...'
