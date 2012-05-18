#= require wmd/wmd
#= require wmd/showdown

$ ->
  new WMDEditor(
    input: "article_content"
    button_bar: "button-bar"
    helpLink: "http://daringfireball.net/projects/markdown/syntax"
  )