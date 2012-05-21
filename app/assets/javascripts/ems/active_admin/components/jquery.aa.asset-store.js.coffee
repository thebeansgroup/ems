class window.AssetStore

  constructor: (@options, el) ->
    defaults = {}

    @options = $.extend( {}, defaults, options );
    @el = $(el)
    @items = @el.find('.asset-item')

    @_init()

  _init: ->
    @._initDel()
    @._initText()
    @._initCopy()


  _initText: ->
    @items.on 'dblclick', '.asset-text', (e)=>
      @._editText $(e.target)


  _initDel: ->
    suffix = "_destroy"
    @items.each (i,el)=>
      $el = $(el)
      hid = $el.find('.asset-id-hidden').clone().val(1).attr("class","asset-destroy-hidden")
      if not hid.length then return false
      name = hid.attr('name').split('[')
      name.splice(-1,1)
      name[name.length] = suffix + "]"
      $el.data 'assetstore-delete', hid.attr( {'name': name.join('[') } )
      @._bindCheck( $el )

  _initCopy: ->
    @items.each (i,el)=>
      $el = $(el)
      $el.find('.asset-container').zclip
        path:'/assets/ems/active_admin/lib/ZeroClipboard.swf'
        afterCopy: () ->
          $('body').animate({
            opacity: 0.7
          }, 100, ->
            $('body').animate({
              opacity: 1
            }, 100)
          )
        copy: () ->
          $el.find('.asset-url').text()

  _bindCheck: ($el)->
    $el.on 'change', '.asset-check', (e)=>
      if $(e.target).is(':checked') then @._keep( $el ) else @._delete( $el )

  _delete: ( $el )->
    delEl = $el.data().assetstoreDelete
    $el.append delEl

  _keep: ( $el )->
    $( '#' + $el.data().assetstoreDelete.attr('id') ).remove()

  _editText: ( $el )->
    input = $("<textarea class='asset-text-input'>#{$el.text()}</textarea>")
    $el.hide().after(input)
    input.focus()
    input.bind 'keydown', (e)=>
      if e.keyCode is 13
        e.preventDefault()
        @._changeText $el, input.val()
        $el.show()
        input.remove()

  _changeText: ( $el, text )->
    $el.text(text).closest('.asset').find('.asset-title-hidden').val(text)


( ( $ ) ->
  $.widget.bridge 'assetStore', window.AssetStore
)( jQuery )


