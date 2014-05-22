fs = require 'fs'
_ = require 'lodash'
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

module.exports = (text, username)->
  [ignore, type, argText] = text.match /board\s+(\w+)\s*(.*)/
  response = commands[type]?.response
  unless typeof response is 'function'
    return message: "Unknown command. #{commands.help.response().message}"
  response argText.trim(), username
