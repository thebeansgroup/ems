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

  update: ->
    @get('channel').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Channel #{@get('channel.title')} updated successfully!"
        @redirect '/channels'

  # function to handle the selecting and deselecting of categories
  toggleCategory: (node, event) ->
    category_id = node.getAttribute('id')
    channel = @get 'channel'
    # retrive the category that was selected/deselected
    category = @get('categories').indexedByUnique('id').get(parseInt(category_id))
    # first we need to check if we actually have the category with the given ID. If we do, let go ahead and add it, or
    # remove it from the channel categories association set.
    if category
      if node.checked
        channel.get("categories").add category
      else
        channel.get("categories").remove category
    else
      throw "No category found with ID: " + category_id