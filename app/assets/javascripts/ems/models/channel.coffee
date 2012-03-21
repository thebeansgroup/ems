class Ems.Channel extends Batman.Model
  @storageKey: 'channels'
  @persist Batman.RailsStorage
  @url = "/ems/channels"
#  category_ids: null

  @hasMany 'categories' #, { autoLoad: true }

  @encode 'id', 'slug', 'name', "created_at", "updated_at"
  @encode "created_at", "updated_at", Batman.Encoders.railsDate
#  @encode 'category_ids',
#    encode: (category_ids, key, object, channel)->
##      console?.log arguments
##      category for category in channel.get('categories')
#      for index, category of channel.get('categories')
#        category.get('id')

  @validate 'name', presence: yes