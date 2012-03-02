class Ems.TagsController extends Batman.Controller

  tag: null

  new: (params) ->
    console?.log "new tags"
    @set 'tag', new Ems.Tag()
    tag = @get 'tag'
    tag.observe 'name', (newVal, oldVal) ->
      console.log "name changed from #{oldVal} to #{newVal}!"
    @form = @render()

  create: (params) ->
#    $('input', @form.get('node')).attr('disabled', true)
#    $('form', @form.get('node')).spin()
    @get('tag').save (err) =>
#      $('form', @form.get('node')).spin(false) # cancels spinner
#      $('input', @form.get('node')).attr('disabled', false)

      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Classifieds.flashSuccess "Tag #{@get('tag.title')} created successfully!"
        @redirect '/tags'