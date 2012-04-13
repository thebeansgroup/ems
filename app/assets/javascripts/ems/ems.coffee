# Create our application and namespace.
class Ems extends Batman.App
  @global yes

  @title = "studentbeans.com EMS"

  Batman.View::prefix = 'assets/ems/views/'

  @navLinks =
  [
    href: "/ems/#!/category/fun-stuff"
    text: "Fun stuff"
    selected : true
  ,
    href: "/ems/#!/category/student-money"
    text: "Student money"
  ,
    href: "/ems/#!/category/student-finance"
    text: "Student finance"
  ,
    href: "/ems/#!/category/extra"
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

  # article routes
  @route '/articles/:category/new', 'articles#new', resource: 'articles', action: 'new'
  @route '/articles/:category/:id/edit', 'articles#edit', resource: 'articles', action: 'edit'
  @route '/articles/:category', 'articles#list', resource: 'articles', action: 'edit'
  
  # news routes
  @route '/news/:category/new', 'news#new', resource: 'news', action: 'new'
  @route '/news/:category/:id/edit', 'news#edit', resource: 'news', action: 'edit'
  @route '/news/:category', 'news#index', resource: 'news', action: 'index'

  # report routes
  @route '/reports/:category/new', 'reports#new', resource: 'reports', action: 'new'
  @route '/reports/:category/:id/edit', 'reports#edit', resource: 'reports', action: 'edit'
  @route '/reports/:category', 'reports#index', resource: 'reports', action: 'index'

  # tags routes
  @resources 'tags'

  # channel routes
  @resources 'channels'

  # category routes
  @resources 'categories'

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