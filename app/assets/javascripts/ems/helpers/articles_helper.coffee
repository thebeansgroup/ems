# Articles helper file

# Batman.mixin Batman.Filters,
#   helper: (input) ->
#     return input

# Method for identifying which category has an association with which channel
# This is used in the channel/_form.html as a way to check/uncheck the checkboxes.

Batman.mixin Batman.Filters,

  getAvailableStatus: ->
    ['draft', 'pending', 'live']
    
  # Helper to return date object in the format of dd/mm/yyyy hh:mm
  # dateTime: (date) ->
    # console?.log date.strftime("%d/%m/%Y %H:%M")
  