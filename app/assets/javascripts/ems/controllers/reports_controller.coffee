class Ems.ReportsController extends Batman.Controller

    report: null
    channels: null
    suggestTags: new Batman.Set
    allTags: null
    selectedChannels: []
    tags: new Batman.Set
  

    index: (params) ->

    show: (params) ->

    # New action, setup all objects needed by the template.
    new: (params) ->
      @set 'report', new Ems.Report
      # give the report the correct category
      # @todo we need to be able to retrieve the category by its slug from the server rather than going round the houses
      # like its currently done
      Ems.Category.load (err, cats) =>
        throw err if err
        # indicator to let us know if we got a valid category slug
        found = false
        # iterate through returned category and check if the result returned includes one with our slug
        for cat in cats
          if(cat.get('slug') == params.category)
            found = true
            @get('report').set('category', cat)
            @set 'channels', @get 'report.category.channels'
        # WHOOPS, we dont seems to have a valid slug or atleast there is no category on the server with this slug
        @redirect '/404' unless found

    # Lets go and persist the new report on the server
    create: (params) ->
      @get('report').save (err) =>
        if err
          throw err unless err instanceof Batman.ErrorsSet
        else
          Ems.flashSuccess "Report #{@get('report.name')} created successfully!"

    # edit action - performs all queries to retrieve the object and all relation from the server for the object id we've
    # been given in params
    edit: (params) ->
      @set 'report', Ems.Report.find parseInt(params.id), (err) =>
        @redirect '/404' if err?.status == 404
        throw err if err
      @get('report.category').fetch (err, category) =>
        throw err if err
        @set 'channels', category.get 'channels'
      # We need to wait a while for the tags to be loaded
      setTimeout(=>
        @set 'tags', @get('report.tags')
      , 100)
      
      setTimeout(=>
        channels = @get 'report.channels'
        if channels
          @get('selectedChannels').push channel.id for channel in channels.toArray()
      , 100)
      
    update: ->
      @get('report').save (err) =>
        if err
          throw err unless err instanceof Batman.ErrorsSet
        else
          Ems.flashSuccess "Report #{@get('report.name')} updated successfully!"
          @redirect '/reports'

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
      @set 'report.channels', newChannels

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
      @get('report.tags').add(tag)

    removeTag: (node, value) ->
      tag = @get('report.tags').indexedByUnique('id').get(parseInt(node.id))
      @get('report.tags').remove(tag)
  
