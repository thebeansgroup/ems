class Ems.Article extends Batman.Model
  @storageKey: 'articles'
  @persist Batman.RailsStorage

  @url = "/ems/articles"
  @belongsTo 'category', saveInline: false, autoload: true

  @encode 'id', 'slug', 'title', 'standfirst', 'content', 'hot', "featured", "toc", "comment", "meta_title",
    "meta_description", "publish_from", "status", "content_disposition", "created_at", "updated_at"
  @encode "publish_from", "created_at", "updated_at", Batman.Encoders.railsDate

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

  sluggify: (text) ->
    text = text.replace /[^\-a-zA-Z0-9\s]/g, ""
    text = text.toLowerCase()
    text = text.replace /\s/g, '-'
