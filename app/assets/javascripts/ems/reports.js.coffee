#= require wmd/wmd
#= require wmd/showdown

$ ->
  new WMDEditor(
    input: "report_content"
    button_bar: "button-bar"
    helpLink: "http://daringfireball.net/projects/markdown/syntax"
  )