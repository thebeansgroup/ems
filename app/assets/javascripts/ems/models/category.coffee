class Ems.Category extends Batman.Model
  @storageKey: 'categories'
  @persist Batman.RailsStorage
  @url = "/ems/categories"
  @hasMany 'channels'

  @encode 'id', 'slug', 'name', 'strapline', "created_at", "updated_at"
  @encode "created_at", "updated_at", Batman.Encoders.railsDate

  @validate 'name', 'strapline', presence: yes


