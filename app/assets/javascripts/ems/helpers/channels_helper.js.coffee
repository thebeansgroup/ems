# Channels helper file


#    category.get('channels')
#    .indexedByUnique('id')
#    .get(channel.get('id'))
#    categories = Category.all
#    console?.log categories

Batman.mixin Batman.Filters,
  selected: (channel, category) ->
    channel.hasCategory category
    # channel.get('categories')
    false

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