class Ems.TagsController extends Batman.Controller

  tag: null

  index:(params) ->
    console?.log "test"

  new: (params) ->
    console?.log "new tags"
    @set 'tags', new Ems.Tag()
    tag = @get 'tags'
    tag.observe 'name', (newVal, oldVal) ->
      console.log "name changed from #{oldVal} to #{newVal}!"

  create: (params) ->
#    $('input', @form.get('node')).attr('disabled', true)
#    $('form', @form.get('node')).spin()
    @get('tags').save (err) =>
#      $('form', @form.get('node')).spin(false) # cancels spinner
#      $('input', @form.get('node')).attr('disabled', false)

      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Tag #{@get('tags.title')} created successfully!"
        @redirect '/tags'