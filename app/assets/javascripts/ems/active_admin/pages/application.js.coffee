#
# Active Admin JS
#
$ ->
  # Date picker
  $(".datepicker").datepicker dateFormat: "dd/mm/yy"

  $(".clear_filters_btn").click ->
    window.location.search = ""
    false

  $(".dropdown_button").popover()

  $('[data-tagcomplete]').tagComplete()

  $('[data-wmd]').each ->
    new WMDEditor(
      input: $(this).data('wmd')
      button_bar: "button-bar"
      helpLink: "http://daringfireball.net/projects/markdown/syntax"
    )

  $('.asset-store').assetStore()