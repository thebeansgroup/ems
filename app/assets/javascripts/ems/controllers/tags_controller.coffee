class Ems.TagsController extends Batman.Controller

  tags: null

  index:(params) ->
#    console?.log "test: " + Ems.get()flashSuccess

  new: (params) ->
    @set 'tag', new Ems.Tag()
    @get('tag').observe 'title', (newVal, oldVal) ->
      console.log "title changed from #{oldVal} to #{newVal}!"

  create: (params) ->
    @get('tag').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Tag #{@get('tag.title')} created successfully!"
        @redirect '/tags'