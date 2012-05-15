class Ems.ArticlesController extends Batman.Controller

  article: null
  channels: null
  suggestTags: new Batman.Set
  allTags: null
  tags: new Batman.Set
  

  index: (params) ->
    @set 'categorySlug', params.category
    filters = {'category_slug':params.category}
    Ems.Article.load {'filters':filters}, (err, articles) =>
      throw err if err
      @set 'articles', Ems.Article.get('loaded') 
      
  show: (params) ->

  # New action, setup all objects needed by the template.
  new: (params) ->
    @set 'article', new Ems.Article
    # give the article the correct category
    # @todo we need to be able to retrieve the category by its slug from the server rather than going round the houses
    # like its currently done
    @set 'category', Ems.Category.find parseInt(params.categoryId), (err) =>
      @redirect '/404' if err?.status is 404
      throw err if err
      
      @set 'channels', new Batman.Set
      @observe 'category', (category, oldCategory)=>
        @set 'article.category', newVal 
        @set 'channels', @get 'category.channels'
      
      
      # # indicator to let us know if we got a valid category slug
      # found = false
      # # iterate through returned category and check if the result returned includes one with our slug
      # for cat in cats
      #   if(cat.get('slug') == params.category)
      #     found = true
      #     @get('article').set('category', cat)
      #     @set 'channels', @get 'article.category.channels'
      # # WHOOPS, we dont seems to have a valid slug or atleast there is no category on the server with this slug
      # @redirect '/404' unless found

  # Lets go and persist the new article on the server
  create: (params) ->
  
    @get('article').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Article #{@get('article.name')} created successfully!"

  # edit action - performs all queries to retrieve the object and all relation from the server for the object id we've
  # been given in params
  edit: (params) ->
    
    # setup action, maily used for observers
    # Obersver 1 - Needed to shov the channels ids into an array for selection in the select html element
    @observe 'article.channels.loaded', (loaded) =>
      if loaded
        channels = @get 'article.channels'
        selectedChannels = @get 'selectedChannels'
        selectedChannels ||= []
        selectedChannels.push channel.id for channel in channels.toArray()
        @set 'selectedChannels', selectedChannels
    @set 'channels', new Batman.Set
    @observe 'article.category.loaded', (loaded) ->
      if loaded
        Ems.Channel.load {filters:{category_id:@get('article.category.id'), order_by:'name'}}, (err, channels) =>
          @set 'channels', Ems.Channel.get('loaded')
        
    # @observe 'article.category.loaded', (loaded) =>
    #   if loaded and not @get 'article.category.channels.loaded'
    #     @get('article.category.channels').load (err, channels) ->
    #       throw err if err
    #       console.log channels
          
            
    @set 'article', Ems.Article.find parseInt(params.id), (err) =>
      @redirect '/404' if err?.status == 404
      throw err if err
      
    

  update: ->
    @get('article').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Article #{@get('article.name')} updated successfully!"
        @redirect '/articles'

  # function to handle the selecting and deselecting of categories
  toggleChannel: (node, event) ->
    # get all channels available for the current category
    channels = @get 'channels'
    newChannels = new Batman.Set
    # populate new channels with selected channels
    for c in node when c.nodeType is 1 and c.selected is true
      channel = channels.indexedByUnique('id').get(parseInt(c.value))
      if channel
        newChannels.add channel
    # replace old channels with new channels
    @set 'article.channels', newChannels

  # Search tags function. This function loads all tags into a collection and uses it to search through the collection to
  # find tags that are simillar to the letters typed
  suggestTags: (node, event) ->
    if node.value.length > 0
      if not @get 'allTags'
        Ems.Tag.load (err, tags) =>
          throw err if err
          @set 'allTags', Ems.Tag.get 'loaded'
      setTimeout(=>
        suggestTags = new Batman.Set
        tags = @get('allTags')
        for tag in tags.toArray() when tag.get('title').indexOf(node.value) >= 0
          suggestTags.add tag
        @set 'suggestTags', suggestTags
      ,100)

  addTag: (node, value) ->
    tag = @get('allTags').indexedByUnique('id').get(parseInt(node.id))
    @get('article.tags').add(tag)

  removeTag: (node, value) ->
    tag = @get('article.tags').indexedByUnique('id').get(parseInt(node.id))
    @get('article.tags').remove(tag)