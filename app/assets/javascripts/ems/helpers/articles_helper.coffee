# Articles helper file

# Batman.mixin Batman.Filters,
#   helper: (input) ->
#     return input

# Method for identifying which category has an association with which channel
# This is used in the channel/_form.html as a way to check/uncheck the checkboxes.

Batman.mixin Batman.Filters,
  checkChannel: (state, channel) ->
    selected = []
    channels = Ems.controllers.get 'articles.article.channels'
    if channels
      channels = channels.toArray()
      selected.push channel.id for channel in channels

    return selected