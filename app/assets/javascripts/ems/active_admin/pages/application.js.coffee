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

  # $('#article_tags').data( "autocomplete" )._renderItem = ( ul, item ) ->
  #   console?.log item
  #   $( "<li></li>" ).data( "item.autocomplete", item )
  #     .append( "<span>#{item.title}</span>")
  #     .appendTo( ul )
