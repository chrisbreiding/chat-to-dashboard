module.exports =

  url: (url)->
    url.replace /[<>]/g, ''

  text: (text)->
    text.replace '&amp;', '&'
