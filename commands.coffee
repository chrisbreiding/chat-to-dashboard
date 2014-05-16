commands =

  standup: (duration)->
    duration = 10 if _.isNaN Number(duration)

    event: 'standup'
    data: duration: duration
    response: "ALL RISE! Commence standup for #{duration} minutes."

  commands: ->
    self = this
    availableCommands = ("  /board #{command}" for own command of commands when command isnt 'unknown').join '\n'

    response: "Available commands:\n#{availableCommands}"

  unknown: ->
    response: "Unknown command sent. #{commands.commands().response}"

module.exports = commands



    # def reload(m)
    #     send m, 'reload_board' do
    #         m.reply "Reload command sent."
    #     end
    # end

    # def youtube(m, id)
    #     send m, 'set_callout', type: :youtube, content: id do

    #     end
    # end

    # def sound(m, url)
    #     send m, 'play_sound', url do

    #     end
    # end
