class Ems.Channel extends Batman.Model
  @storageKey: 'channels'
  @persist Batman.RestStorage
  @url = "/ems/channels"

  @hasMany 'categories' #, { autoLoad: true }

  @encode 'id', 'slug', 'name', "created_at", "updated_at"
  @encode "created_at", "updated_at", Batman.Encoders.railsDate

  @validate 'name', presence: yes

  @on "categories.loaded", ->
    console.log "categories.loaded"

