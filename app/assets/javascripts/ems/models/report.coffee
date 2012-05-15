class Ems.Report extends Ems.Base
  @storageKey: 'reports'
  @persist Batman.RailsStorage
  @resourceName: 'report'

  @url = "/ems/reports"
  @hasOne 'category', { saveInline: false, autoload: false }
  @hasMany 'channels', { saveInline: false, autoload: false }
  @hasMany 'tags', { saveInline: false, autoload: false }
  @hasMany 'articles', { saveInline: false, autoload: false }
  @hasMany 'reports', { saveInline: false, autoload: false }
  @hasMany 'news', { saveInline: false, autoload: false }
  @hasMany 'images', { saveInline: false, autoload: true }
  
  channel_ids: null
  tag_ids: null
  selectedChannels: null
  availableStatus: null

  @encode 'id', 'slug', 'title', 'standfirst', 'content', 'hot', "featured", "toc", "comment", "meta_title",
    "meta_description", "publish_from", "status", "content_disposition", "created_at", "updated_at", "image", "report"
  @encode "publish_from", "created_at", "updated_at", Batman.Encoders.railsDate

  @encode 'channel_ids',
    encode: (channelIds, name, object, report) ->
      channelIds ||= []
      channels =  report.get('channels')
      if channels
        channelIds.push channel.id for channel in channels.toArray()

      return channelIds
      
  @encode 'tag_ids',
    encode: (tagIds, name, object, report) ->
      tagIds ||= []
      tags =  report.get('tags')
      if tags
        tagIds.push tag.id for tag in tags.toArray()

      return tagIds

  # Accessors
  # we need to override these accessors because we want to change the meta info at the same time.
  @accessor 'title',
    get: -> @title
    set: (k, v) ->
      @set('meta_title', v)
      @set('slug', v)
      @title = v;
      @title
  @accessor 'standfirst',
    get: -> @standfirst
    set: (k, v) ->
      @set('meta_description', v)
      @standfirst = v;
      @standfirst
  @accessor 'slug',
    get: -> @slug
    set: (k, v) ->
      @slug = @sluggify(v);
      @standfirst
      

  # Sluggify method to convert a normal string to be sluggable
  sluggify: (text) ->
    text = text.replace /[^\-a-zA-Z0-9\s]/g, ""
    text = text.toLowerCase()
    text = text.replace /\s/g, '-'
