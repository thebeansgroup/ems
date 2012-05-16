# Create our application and namespace.
class Ems extends Batman.App
  @global yes

  @title = "studentbeans.com EMS"

  Batman.ViewStore.prefix = 'assets/ems/views/'

  @navLinks =
  [
    text: "Articles" 
    href: "/ems/#!/articles/"
    secondary:
      [
        text: "Show Insight Articles" 
        href: "/ems/#!/categories/insight/articles"
      ,
        text: "New Insight Article" 
        href: "/ems/#!/categories/insight/articles/new"        
      ]
  ,
    text: "Reports" 
    href: "/ems/#!/reports/"
    secondary:
      [
        text: "Show Insight Reports" 
        href: "/ems/#!/categories/insight/reports"
      ,
        text: "New Insight Report" 
        href: "/ems/#!/categories/insight/reports/new"        
      ]
  ,
    text: "News" 
    href: "/ems/#!/company-news/"
    secondary:
      [
        text: "Show Company News" 
        href: "/ems/#!/categories/company-news/reports"
      ,
        text: "New Company News" 
        href: "/ems/#!/categories/company-news/news/new"        
      ]
  ,
    href: "/ems/#!/logout"
    text: "Log out"
  ]

  # setup our root route. When the app starts up, it will automatically call TodosController::index
  # main app routing
  @root 'ems#index'
  @route '404', 'ems#fourohfour'

  # category routes
  @resources 'categories', ->
    # Article routes
    @resources 'articles', ->
      @member 'article', 'preview', {action: 'preview'}
    # News routes
    @resources 'news', ->
      @member 'news', 'preview', {action: 'preview'}
    # Report routes
    @resources 'reports', ->
      @member 'report', 'preview', {action: 'preview'}    

  # tags routes
  @resources 'tags'

  # channel routes
  @resources 'channels'

  # accessible via

  @on 'run', ->
    console?.log "Running ...."

  @on 'ready', ->
    console?.log "Ems ready for use."

  @flash: Batman()
  @flash.accessor
    get: (key) -> @[key]
    set: (key, value) ->
      @[key] = value
      if value isnt ''
        setTimeout =>
          @set(key, '')
        , 2000
      value

  @flashSuccess: (message) -> @set 'flash.success', message
  @flashError: (message) ->  @set 'flash.error', message