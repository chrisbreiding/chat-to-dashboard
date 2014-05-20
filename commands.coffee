fs = require 'fs'
_ = require 'lodash'

availableCommands = ->
  command.desc for own type, command of commands when type isnt 'unknown'

commands =

  help:
    desc: """
          /board help
            View available commands
          """
    response: ->
      message: "Available commands:\n\n#{availableCommands().join('\n\n')}"

  unknown:
    response: ->
      message: "Unknown command sent. #{commands.help.response().message}"

for fileName in fs.readdirSync("#{__dirname}/commands")
  command = fileName.split('.')[0]
  commands[command] = require "./commands/#{command}"

module.exports = commands
