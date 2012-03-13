class Ems.Channel extends Batman.Model
  @storageKey: 'channels'
  @persist Batman.RestStorage
  @url = "/ems/channels"

  @hasMany 'categories' #, { autoLoad: true }

  @encode 'id', 'slug', 'name', "created_at", "updated_at"
  # @encode "created_at", "updated_at", Batman.Encoders.railsDate

  @validate 'name', presence: yes

  hasCategory: (category) =>
    console?.log category
    console?.log @get "name"
    setTimeout(=>
      @get("categories").load(=>
          console?.log arguments[1]
      )
    ,1000*4)

#    categories?.indexedByUnique('id').get(channel.get('id'))
#    console?.log categories


#      @get('categories').add(category)