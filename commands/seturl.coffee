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

  response: (argText)->
    unless argText
      return event: 'seturl'

    [paneId, url] = argText.split /\s+/

    unless url
      suggestion = format(command).suggestion()
      return message: "You must include both the pane ID and the URL. #{suggestion}"

    event: 'seturl'
    data:
      paneId: paneId
      url: deSlack.url url

module.exports = command
