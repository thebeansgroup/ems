class Ems.ChannelsController extends Batman.Controller
  channels: null

  index: (params) ->

  show: (params) ->

  new: (params) ->
    @set 'channel', new Ems.Channel

  create: (params) ->
    @get('channel').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Channel #{@get('channel.name')} created successfully!"
        @redirect '/tags'

  edit: (params) ->
    channel = @set 'channel', Ems.Channel.find parseInt(params.id), (err) ->
      throw err if err

      if !channel.get("categories.loaded")
        channel.get('categories').load (err, products) ->
          throw err if err
  update: ->
    @get('channel').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Channel #{@get('channel.title')} updated successfully!"
        @redirect '/channels'