class window.AutoCompleteSearch

  constructor: (@options, el) ->

    defaults = {}

    @options = $.extend( {}, defaults, options );
    @el = $(el)
    @hiddenEl = $("#article_tag_ids")

    @_init()

  _init: ->
    self = @
    url = @el.data('autocompletesearch')
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
        console?.log self.hiddenEl
        self.hiddenEl.find("[value=#{ui.item.id}]").attr('selected','selected')
        self._addToList ui.item.title, ui.item.id
        false

    @el.data( "autocomplete" )._renderItem = ( ul, item )->
      $( "<li></li>" ).data( "item.autocomplete", item )
        .append( "<a>" + item.title + "</a>" )
        .appendTo( ul )


  _addToList: ( title, id )->
    console?.log "Select", title, id
    $("<li id='tag-list-#{id}'></li>").append(title).appendTo('#tag-list')


( ( $ ) ->
  $.widget.bridge 'autoCompleteSearch', window.AutoCompleteSearch
)( jQuery )


