# Channels helper file

#Batman.mixin Batman.Filters,
#   helper: (input) ->
#     return input

Batman.mixin Batman.Filters,

  # Method for identifying which category has an association with which channel
  # This is used in the channel/_form.html as a way to check/uncheck the checkboxes.
  checkCategory: (state, category) ->
    controller = Ems.controllers.get 'channels'
    channel = controller.get "channel"
    return false unless channel.get 'categories'
    channel.get('categories').indexedByUnique('id').get(category.get('id'))