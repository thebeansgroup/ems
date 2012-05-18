class window.TagComplete

  constructor: (@options, el) ->

    defaults = {}

    @options = $.extend( {}, defaults, options );
    @el = $(el)
    @hiddenEl = $("#article_tag_ids")

    @_init()

  _init: ->
    self = @
    url = @el.data('tagcomplete')
    @el.autocomplete
      minLength: 0
      source: (request, response)->
        console?.log "Request", request.term
        send = "filters[like]" : request.term

        $.getJSON url, send, ( data, status, xhr )->
          response( data )
      focus: ( event, ui )->
        console?.log "Focus", ui.item.title
        false
      select: ( event, ui )->
        if $("#tag-list-#{ui.item.id}").length then return false
        self.hiddenEl.find("[value=#{ui.item.id}]").attr('selected','selected')
        self._addToList ui.item.title, ui.item.id
        false

    @el.data( "autocomplete" )._renderItem = ( ul, item )->
      $( "<li></li>" ).data( "item.autocomplete", item )
        .append( "<a>" + item.title + "</a>" )
        .appendTo( ul )


  _addToList: ( title, id )->
    $("<li id='tag-list-#{id}' class='pill'></li>").append(title).appendTo('#tag-list')


( ( $ ) ->
  $.widget.bridge 'tagComplete', window.TagComplete
)( jQuery )


