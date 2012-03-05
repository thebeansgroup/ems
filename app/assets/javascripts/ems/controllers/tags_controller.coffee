class Ems.TagsController extends Batman.Controller

  tags: null

  index: (params) ->

  show: (params) ->

  new: (params) ->
    @set 'tag', new Ems.Tag()

  create: (params) ->
    @get('tag').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Tag #{@get('tag.title')} created successfully!"
        @redirect '/tags'

  edit: (params) ->
    @set 'tag', Ems.Tag.find parseInt(params.id), (err) ->
      throw err if err
    @form = @render()

  update: ->
    @get('tag').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Tag #{@get('tag.title')} updated successfully!"
        @redirect '/tags'