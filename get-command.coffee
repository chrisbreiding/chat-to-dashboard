fs = require 'fs'
format = require './help-formatter'

commands =
  help:
    name: 'help'
    desc: 'View available commands. Pass in the name of the command for details'
    args: [
      name: 'command'
      required: 'optional'
      desc: 'Name of the command'
    ]
    response: (command)->
      if command and commands[command]
        return message: format(commands[command]).full()
      message: """
               Available commands:
               #{availableCommands().join('\n')}

               Pass in the name of the command to see details (e.g. board help url)
               """

for fileName in fs.readdirSync("#{__dirname}/commands")
  command = fileName.split('.')[0]
  commands[command] = require "./commands/#{command}"

availableCommands = ->
  format(command).command() for own type, command of commands

unknownCommand =
  response: -> message: "Unknown command. #{commands.help.response().message}"

module.exports = (type)->
  commands[type] or unknownCommand
