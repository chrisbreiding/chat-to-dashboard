_ = require 'lodash'
format = require '../help-formatter'
deSlack = require '../de-slack'

command =

  name: 'seturl'
  desc: 'Without args, displays pane IDs. With args, sets the url for the specified pane.'
  args: [
    name: 'pane id'
    required: 'optional'
    desc: 'ID of the pane'
  ,
    name: 'url'
    required: 'optional, required with pane id'
    desc: 'URL to set the pane to'
  ]

  _responseObject: (paneId, url, message)->
    event: 'seturl'
    data:
      paneId: paneId
      url: url
    message: message

  response: (argText)->
    unless argText
      return @_responseObject null, null, 'Displaying pane IDs...'

    [paneId, url] = argText.split /\s+/

    unless url
      suggestion = format(command).suggestion()
      return message: "You must include both the pane ID and the URL. #{suggestion}"

    duration = 30 if _.isNaN parseInt(duration, 10)
    @_responseObject paneId, deSlack.url(url), "Setting pane ##{paneId} to #{url}..."

module.exports = command
