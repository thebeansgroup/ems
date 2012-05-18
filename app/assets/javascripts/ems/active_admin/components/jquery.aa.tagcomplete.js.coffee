class window.TagComplete

  constructor: (@options, el) ->
    defaults = {}

    @options = $.extend( {}, defaults, options );
    @el = $(el)
    @hiddenEl = $("#article_tag_ids")
    console.log @el.data('tagcomplete_pills'), @el.data()
    @pills = $(@el.data('tagcomplete_pills'))

    @_init()
    @_bind()

  _init: ->
    self = @
    url = @el.data('tagcomplete')
    @el.autocomplete
      minLength: 2
      source: (request, response)->
        send = "filters[like]" : request.term
        $.getJSON url, send, ( data, status, xhr )->
          response( data )
      focus: ( event, ui )->
        false
      select: ( event, ui )->
        if not $("#tag-list-#{ui.item.id}").length then self._add ui.item.title, ui.item.id
        false
      appendTo: @el.parent()

    @._customList()    

  _bind: ->
    @pills.on "click", ".close", (e, el)=>
      @._remove $(e.target).parent().attr('id').replace('tag-list-','')
      e.preventDefault()

  _customList: ->
    @el.data( "autocomplete" )._renderItem = ( ul, item )->
      $( "<li></li>" ).data( "item.autocomplete", item )
        .append( "<a>" + item.title + "</a>" )
        .appendTo( ul )

  _add: ( title, id )->
    @.hiddenEl.find("[value=#{id}]").attr('selected','selected')
    @._addToList title, id

  _remove: ( id )->
    @.hiddenEl.find("[value=#{id}]").removeAttr('selected')
    @._removeFromList id

  _addToList: ( title, id )->
    $("<li id='tag-list-#{id}' class='pill'></li>").append("#{title} <span class='close'>×</span>").appendTo('#tag-list')

  _removeFromList: ( id )->
    $("#tag-list-#{id}").remove()

( ( $ ) ->
  $.widget.bridge 'tagComplete', window.TagComplete
)( jQuery )


