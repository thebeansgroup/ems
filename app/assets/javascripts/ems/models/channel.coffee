class Ems.Channel extends Batman.Model
  @storageKey: 'channels'
  @persist Batman.RestStorage
  @url = "/ems/channels"

  @hasMany 'categories' #, { autoLoad: true }

  @encode 'id', 'slug', 'name', "created_at", "updated_at"
  @encode "created_at", "updated_at", Batman.Encoders.railsDate

  @validate 'name', presence: yes


  # static function to handle the selecting and deselecting of categories
  @toggleCategory: (node, event) ->
    category_id = node.getAttribute('id')
    # get channel and categories from the controller
    channel = Ems.controllers.get('channels').channel
    categories = Ems.controllers.get('channels').categories
    # retrive the category that was selected/deselected
    category = categories.indexedByUnique('id').get(parseInt(category_id))
    # first we need to check if we actually have the category with the given ID. If we do, let go ahead and add it, or
    # remove it from the channel categories association set.
    if category
      if node.checked
        channel.get("categories").add category
      else
        channel.get("categories").remove category
    else
      throw "No category found with ID: " + category_id
    console?.log channel.get("categories")

