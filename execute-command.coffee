_ = require 'lodash'
Pusher = require 'pusher'
getCommand = require './get-command'

pusher = new Pusher
  appId: process.env.PUSHER_APP_ID
  key: process.env.PUSHER_KEY
  secret: process.env.PUSHER_SECRET

parseText = (text)->
  [ignore, type, argText] = text.match /board\s+(\w+)\s*(.*)/
  [type, argText]

argStrings = (fn)->
  matches = fn.toString().match /^function\s*\((.*)\)/
  _.map matches[1].split(','), (arg)-> arg.trim()

argMap =
  argString: 'text'
  username: 'user_name'

needs = (args, responseFn)->
  return [] unless _.isFunction responseFn
  _.map argStrings(responseFn), (key)->
    args[argMap[key] or key]

module.exports = (slackArgs)->
  [type, argText] = parseText slackArgs.text
  slackArgs.text = argText.trim()
  command = getCommand type
  result = command.response needs(slackArgs, command.response)...

  if result.event
    pusher.trigger slackArgs.channel_name, result.event, (result.data || {})

  result.message
