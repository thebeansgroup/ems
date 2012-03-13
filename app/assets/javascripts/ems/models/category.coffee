class Ems.Category extends Batman.Model
  @storageKey: 'categories'
  @persist Batman.RestStorage
  @url = "/ems/categories"
  @hasMany 'channels'

  @encode 'id', 'slug', 'name', 'strapline', "created_at", "updated_at"
  # @encode "created_at", "updated_at", Batman.Encoders.railsDate

  @validate 'name', 'strapline', presence: yes
  # @global yes

  @on "channels.loaded", ->
    throw Error 'ARRRRRHHHHH'
    console.log 'loaded: ',arguments

  isShowing: yes
    # if @get("channels").isEmpty then false else true