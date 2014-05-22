module.exports =

  url: (url)->
    url.replace(/[<>]/g, '')
