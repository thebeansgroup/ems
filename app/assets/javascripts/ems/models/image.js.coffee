class Ems.Image extends Ems.Base
  @storageKey: 'images'
  @persist Batman.RailsStorage
  @url = "/ems/images"
  @encode 'id', 'title', 'alt'