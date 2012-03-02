#= require_self

# Create our application and namespace.
class Ems extends Batman.App
  @global yes

  Batman.View::prefix = 'assets/ems/views/'

  @navLinks =
  [
    href: "/ems/#!/category/fun-stuff"
    text: "Fun stuff"
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
  # categories routing
  @route '/categories/:slug', 'categories#index', resource: 'categories', action: 'index'
  # article routes
  @route '/articles/:category/new', 'articles#new', resource: 'articles', action: 'new'
  # series routes
  @route '/series/:category/new', 'articles#new', resource: 'articles', action: 'new'
  # tag routes
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