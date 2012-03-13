# Channels helper file

#Batman.mixin Batman.Filters,
#   helper: (input) ->
#     return input

Batman.mixin Batman.Filters,

  # Method for identifying which category has an association with which channel
  # This is used in the channel/_form.html as a way to check/uncheck the checkboxes.
  hasCategory: (channel, category) ->
    category.get('channels').indexedByUnique('id').get(channel.get('id'))

  toggleCategory: (node, event) ->
    console?.log arguments