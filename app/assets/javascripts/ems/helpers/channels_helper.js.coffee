# Channels helper file

Batman.mixin Batman.Filters,
   selected: (channel, category) ->
     categories = channel.get 'categories'
#     setTimeout((->), 1)
     console?.log categories