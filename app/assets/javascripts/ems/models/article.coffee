class Ems.Article extends Batman.Model
  @storageKey: 'articles'
  @persist Batman.RailsStorage

  @url = "/ems/articles"
  @belongsTo 'category', saveInline: true, autoload: true

  @encode 'id', 'slug', 'title', 'standfirst', 'content', 'hot', "featured", "toc", "comment", "meta_title",
    "meta_description", "publish_from", "status", "content_disposition", "created_at", "updated_at"
  @encode "publish_from", "created_at", "updated_at", Batman.Encoders.railsDate

  @observe "title", (newVal, oldval) ->
    if (@get "meta_title" is oldval)
      console?.log "title changed"
      @set "meta_title", newVal

  @observe "standfirst", (newVal, oldval) ->
    if (@get "standfirst" is oldval)
      console?.log "standfirst changed"
      @set "meta_description", newVal