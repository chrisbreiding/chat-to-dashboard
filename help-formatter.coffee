_ = require 'lodash'

module.exports = (command)->

  command: ->
    args = _.map command.args, (arg)->
      formattedArg = "[#{arg.name}]"
      if arg.quoted
        formattedArg = "'#{formattedArg}'"
      formattedArg
    args = if command.args?.length then " #{args.join ' '}" else ''
    "board #{command.name}#{args}"

  desc: ->
    command.desc

  args: ->
    return null unless command.args

    args = _.map command.args, (arg)->
      dfault = if arg.default then " - default: #{arg.default}" else ''
      "    _#{arg.name}_ (#{arg.required}) #{arg.desc}#{dfault}"
    """
    Args:
    #{args.join '\n'}
    """

  aliases: ->
    return null unless command.aliases
    "Aliases: #{command.aliases.join(', ')}"

  suggestion: ->
    "Try: `#{@command()}`"

  full: ->
    fullHelp = ["*#{@command()}*", @desc()].join '\n'
    if args = @args()
      fullHelp = "#{fullHelp}\n#{args}"
    if aliases = @aliases()
      fullHelp = "#{fullHelp}\n#{aliases}"
    fullHelp
