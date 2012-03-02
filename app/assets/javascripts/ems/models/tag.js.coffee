class Ems.Tag extends Batman.Model
  @persist Batman.RailsStorage
  @url = "/ems/tags"
  @storageKey: 'tags'

  @encode 'id', 'title', 'slug', 'description'

#  @validate 'title', presence: yes
#  @validate 'description', presence: yes