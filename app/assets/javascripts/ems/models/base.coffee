class Ems.Base extends Batman.Model

  sluggify: (text) ->
    text = text.replace /[^\-a-zA-Z0-9\s]/g, ""
    text = text.toLowerCase
    text = text.replace /\s/g, '-'