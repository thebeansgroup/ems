class Ems.ChannelsController extends Batman.Controller
  channels: null
  categories: null

  index: (params) ->

  show: (params) ->

  new: (params) ->
    @set 'channel', new Ems.Channel
    Ems.Category.load (err, categories) =>
      throw err if err
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
    Ems.Category.load (err, categories) =>
      throw err if err
      @set 'categories', categories

  update: ->
    @get('channel').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Channel #{@get('channel.title')} updated successfully!"
        @redirect '/channels'