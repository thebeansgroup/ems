class Ems.Tag extends Ems.Base
  @global yes
  @persist Batman.RailsStorage
  @url = "/ems/tags"
  @storageKey: 'tags'
  @resourceName: 'tag'

  @hasMany 'articles', { saveInline: false, autoload: false }

  @encode 'id', 'title', 'slug', 'description', "created_at", "updated_at"
  @encode "created_at", "updated_at", Batman.Encoders.railsDate

  @validate 'title', 'description', presence: yes