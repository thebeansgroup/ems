class Ems.Channel extends Batman.Model
  @storageKey: 'channels'
  @persist Batman.RailsStorage
  @url = "/ems/channels"
  @hasMany 'categories'

  @encode 'id', 'slug', 'name', "created_at", "updated_at"
  @encode "created_at", "updated_at", Batman.Encoders.railsDate

  @validate 'name', presence: yes

  @accessor 'category',
    get: (id) ->
      console?.log "getting categories"
#      categories = @get 'categories'
#      categories?.indexedByUnique('id').get(channel.get('id'))
    set: (category) ->
      console?.log "setting category"
    toggle: (category) ->
      console?.log "toggle category"

