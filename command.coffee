fs = require 'fs'
_ = require 'lodash'
format = require './help-formatter'

commands =
  help:
    name: 'help'
    desc: 'View available commands'
    response: ->
      message: "Available commands:\n\n#{availableCommands().join('\n\n')}"

for fileName in fs.readdirSync("#{__dirname}/commands")
  command = fileName.split('.')[0]
  commands[command] = require "./commands/#{command}"

availableCommands = ->
  format(command).full() for own type, command of commands

module.exports = (text)->
  [ignore, type, argText] = text.match /board\s+(\w+)\s*(.*)/
  response = commands[type]?.response
  unless typeof response is 'function'
    return message: "Unknown command. #{commands.help.response().message}"
  response (argText.trim() or undefined)
