class Ems.Channel extends Batman.Model
  @storageKey: 'channels'
  @persist Batman.RailsStorage
  @url = "/ems/channels"
  @hasMany 'categories'

  @encode 'id', 'slug', 'name', "created_at", "updated_at"
  @encode "created_at", "updated_at", Batman.Encoders.railsDate

  @validate 'name', presence: yes
