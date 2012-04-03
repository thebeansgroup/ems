class Ems.Report extends Batman.Model
  @storageKey: 'reports'
  @persist Batman.RailsStorage

  @url = "/ems/reports"
  @hasOne 'category', { saveInline: false, autoload: false }
  @hasMany 'channels', { saveInline: false, autoload: false }
  @hasMany 'tags', { saveInline: false, autoload: false }
  @hasMany 'articles', { saveInline: false, autoload: false }
  @hasMany 'reports', { saveInline: false, autoload: false }
  @hasMany 'news', { saveInline: false, autoload: false }
