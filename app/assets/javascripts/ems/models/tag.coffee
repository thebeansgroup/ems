class Ems.Tag extends Ems.Model
  @persist Batman.RailsStorage
  @url = "/ems/tags"
  @storageKey: 'tags'

  @encode 'id', 'title', 'slug', 'description', "created_at", "updated_at"
  @encode "created_at", "updated_at", Batman.Encoders.railsDate

  @validate 'title', 'description', presence: yes