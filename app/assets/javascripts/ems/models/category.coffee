class Ems.Category extends Ems.Base
  @global yes
  @storageKey: 'categories'
  @resourceName: 'category'
  @persist Batman.RailsStorage
  @url = "/ems/categories"
  @hasMany 'channels', { saveInline: false, autoload: false }
  @hasMany 'articles', { saveInline: false, autoload: false }
  @hasMany 'news', { saveInline: false, autoload: false }
  @hasMany 'reports', { saveInline: false, autoload: false }

  @encode 'id', 'slug', 'name', 'strapline', "created_at", "updated_at"
  @encode "created_at", "updated_at", Batman.Encoders.railsDate

  @validate 'name', 'strapline', presence: yes