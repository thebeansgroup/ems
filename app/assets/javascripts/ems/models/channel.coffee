class Ems.Channel extends Batman.Model
  @global yes
  @storageKey: 'channels'
  @persist Batman.RailsStorage
  @url = "/ems/channels"
  category_ids: null

  @hasMany 'categories', saveInline: false

  @encode 'id', 'slug', 'name', "created_at", "updated_at"
  @encode "created_at", "updated_at", Batman.Encoders.railsDate
  @encode 'category_ids',
    encode: (categoryIds, name, object, channel) ->
      categories =  channel.get('categories').toArray()
      categoryIds ||= []
      for category in categories
        categoryIds.push(category.get('id'))

      return categoryIds

  @validate 'name', presence: yes