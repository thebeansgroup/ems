class Ems.ChannelsController extends Batman.Controller
  channels: null
  categories: null

  index: (params) ->

  show: (params) ->

  new: (params) ->
    @set 'channel', new Ems.Channel
    Ems.Category.load (err, cats) =>
      throw err if err
      categories = new Batman.Set
      for i, category of cats
        categories.add category
      @set 'categories', categories

  create: (params) ->
    @get('channel').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Channel #{@get('channel.name')} created successfully!"
        @redirect '/tags'

  edit: (params) ->
    @set 'channel', Ems.Channel.find parseInt(params.id), (err) ->
      throw err if err
    Ems.Category.load (err, cats) =>
      throw err if err
      categories = new Batman.Set
      for i, category of cats
        categories.add category
      @set 'categories', categories
      # This console log should print out a set containing 1 category object. However it unfortunately returns an empty
      # AssociationSet. When looking at the XHR return from the server I can clearly see the JSON object being returned
      # It just doesn't seem to be added the the channels association set of categories.
      console?.log @get('channel').get('categories')
      # This console log prints out a Batman.Set containing all the channels associated to this category. All seems to
      # be working here.
      console?.log category.get('channels')

  update: ->
    @get('channel').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Channel #{@get('channel.title')} updated successfully!"
        @redirect '/channels'