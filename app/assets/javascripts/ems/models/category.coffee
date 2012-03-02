class Ems.Category extends Batman.Model
  @storageKey: 'categories'
  @persist Batman.RailsStorage

  @encode 'id'
  @encode 'name'
  @encode 'slug'
  @encode 'strapline'
