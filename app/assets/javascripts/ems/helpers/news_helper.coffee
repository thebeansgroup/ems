# News helper file

Batman.mixin Batman.Filters,
#   helper: (input) ->
#     return input
  newsCheckChannel: (state, channel) ->
    selected = []
    channels = Ems.controllers.get 'news.news.channels'
    if channels
         selected.push channel.id for channel in channels.toArray()

    return selected