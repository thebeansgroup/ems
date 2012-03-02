class Ems.Tag extends Batman.Model
  @storageKey: 'tags'
  @persist Batman.RailsStorage

  @encode 'id', 'name', 'slug', 'description'
