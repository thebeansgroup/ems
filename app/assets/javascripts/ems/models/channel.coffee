class Ems.Channel extends Batman.Model
  @storageKey: 'channels'
  @persist Batman.RailsStorage
  @url = "/ems/channels"

  @hasMany 'categories', { autoLoad: true }

  @encode 'id', 'slug', 'name', "created_at", "updated_at"
  @encode "created_at", "updated_at", Batman.Encoders.railsDate

  @validate 'name', presence: yes

  hasCategory: (category) ->
    console?.log controllers

#    categories?.indexedByUnique('id').get(channel.get('id'))
#    console?.log categories


#      @get('categories').add(category)