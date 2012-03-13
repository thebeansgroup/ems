class Ems.Category extends Batman.Model
  @storageKey: 'categories'
  @persist Batman.RestStorage
  @url = "/ems/categories"
  @hasMany 'channels'

  @encode 'id', 'slug', 'name', 'strapline', "created_at", "updated_at"
  @encode "created_at", "updated_at", Batman.Encoders.railsDate

  @validate 'name', 'strapline', presence: yes

  @toggleSelected: (node, event) ->
    channel = Ems.controllers.get('channels').channel
    categories = Ems.controllers.get('channels').categories
#    console.log categories.get('channels')
#    channel.get('categories').add(category)
  @on "channels.loaded", ->
    console.log "channels.loaded"