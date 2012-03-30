class Ems.Category extends Batman.Model
  @global yes
  @storageKey: 'categories'
  @persist Batman.RailsStorage
  @url = "/ems/categories"
  @hasMany 'channels', { saveInline: false, autoload: false }
  @hasMany 'articles', { saveInline: false, autoload: false }

  @encode 'id', 'slug', 'name', 'strapline', "created_at", "updated_at"
  @encode "created_at", "updated_at", Batman.Encoders.railsDate

  @validate 'name', 'strapline', presence: yes