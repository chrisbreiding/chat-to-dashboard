module.exports =

  desc: """
        /board reload
          Reload the board
        """

  response: ->
    event: 'reload'
    message: 'Reloading board...'
