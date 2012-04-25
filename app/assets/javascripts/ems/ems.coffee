# Create our application and namespace.
class Ems extends Batman.App
  @global yes

  @title = "studentbeans.com EMS"

  Batman.ViewStore.prefix = 'assets/ems/views/'

  @navLinks =
  [
    href: "/ems/#!/categories/fun-stuff"
    text: "Fun stuff"
  ,
    href: "/ems/#!/categories/student-money"
    text: "Student money"
  ,
    href: "/ems/#!/categories/student-finance"
    text: "Student finance"
  ,
    href: "/ems/#!/categories/extra"
    text: "Extra"
  ,
    href: "/ems/#!/more"
    text: "More"
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