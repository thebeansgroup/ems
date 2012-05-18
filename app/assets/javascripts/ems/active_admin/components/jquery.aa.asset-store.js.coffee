class window.AssetStore

  constructor: (@options, el) ->
    defaults = {}

    @options = $.extend( {}, defaults, options );
    @el = $(el)
    @items = @el.find('.asset-item')    

    @_init()

  _init: ->
    suffix = "_destroy"
    @items.each (i,el)=>
      $el = $(el)
      hid = $el.next().clone().val(1)
      name = hid.attr('name').split('[')
      delete name[name.length-1]
      name[name.length] = suffix + "]"
      $el.data 'assetstore-delete', hid.attr( {'name': name.join('[') } )
      @._bindCheck( $el )

  _bindCheck: ($el)->
    $el.on 'change', '.asset-check', (e)=>
      if $(e.target).is(':checked') then @._keep( $el ) else @._delete( $el )

  _delete: ( $el )->
    delEl = $el.data().assetstoreDelete
    $el.after delEl

  _keep: ( $el )->
    $( '#' + $el.data().assetstoreDelete.attr('id') ).remove()

( ( $ ) ->
  $.widget.bridge 'assetStore', window.AssetStore
)( jQuery )


