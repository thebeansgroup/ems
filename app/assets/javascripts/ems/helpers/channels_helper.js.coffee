# Channels helper file



Batman.mixin Batman.Filters,
  hasCategory: (channel, category) ->
    category.get('channels').indexedByUnique('id').get(channel.get('id'))

  toggleCategory: (channel, test, test2) ->
#    channel.get('categories')
#    .indexedByUnique('id').get(category.get('id'))
    console?.log Ems.channels
#    if present
##      channel.categories.add category
#      console?.log "test"
#    else
##      channel.categories.remove category
#      console?.log "test"