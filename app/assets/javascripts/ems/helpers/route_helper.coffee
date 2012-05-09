# Mixin to aid the compilation of routes
#
# @mixin
# @author Vincent Siebert <vincent@siebert.im>
# @copyright (c) 2012 The Beans Group Ltd
Batman.mixin Batman.Filters,
  
  # Filter to aid the compilation of non CRUD routes. Unfortunately because there is no way of resolving a keypath in an object when passing
  # in the arguments I had to come up with a convention that enables the filter to retrospectively look up the object. 
  # This means that the helper will try and resolve any route arguments values which start with a '='. The '=' was chosen to
  # signal to the developer that the following statement is going to be evaluated.
  # Please see the following information for examples of how this helper can be used
  #
  # The following examples assumes that objects foo and bar are accessible in the helper's context
  #
  # foo = {'propertyX':'x','differentProperty':'xy'}
  # bar = {'propertyY':'y'}
  #
  # @example How to use the routeTo filter for route 'foo/:propertyX'
  #          This will result in 'foo/x'
  # data-route="foo | routeTo 'foo'"
  #
  # @example Same route as above however manually specifing the property which should be used to replace the route argument
  #          This will result in 'foo/xy'
  # data-route="foo | routeTo {'name:'foo','args':{'propertyX':'=foo.differentProperty'}}"
  #
  # @example How to use the routeTo filter for route 'foo/:propertyX/bar/:propertyY'
  #          This will result in 'foo/x/bar/y'
  # data-route="foo | routeTo {'name':'fooBar','args':{'bar':'=bar.propertyY'}}"
  #
  # @param 
  routeTo: (record, opts)->
    # because we can deal with either a string or an object as the opts we need to see how we get to the args and route name
    # I we are dealing with a string we can assume that its the route name. If we are dealing with an object we need to get
    # the route name with is at position name, and the arguments which can be found at position args in the object
    if typeof(opts) is 'string'
      routeName = opts
      args = {}
    else
      routeName = opts.name
      args = opts.args
    # now lets try and get the route
    if routeName
      route = Batman.currentApp.get("routes.#{routeName}")
    else
      Batman.developer.error("Could not gather routeName from opts '#{opts}'")
    # if we have the route lets continue
    if route
      
      if route.collectionRoute
        finalRoute = route.collectionRoute
        namedArgs = finalRoute.namedArguments
      else
        finalRoute = route.get('routeMap.memberRoute')
        namedArgs = finalRoute.namedArguments
      if namedArgs
        specialArgs = {}
        specialArgs[obj] = prop.replace('=', '') for obj, prop of args when typeof(prop) is 'string' and prop.indexOf('=') is 0
        for specialArg, keyPath of specialArgs
          try
            args[specialArg] = @get keyPath
          catch error
            Batman.developer.error("Could not retrieve value '#{specialArg}' from object, #{error}")        
        # OK all the hard work is done we can try and populate any missing fields from the main record     
        args[arg] = record.get(arg) for arg in namedArgs when record.get(arg) isnt (null or undefined) and args[arg] is undefined
    else
      Batman.developer.error("Could not find route '#{routeName}'")
    # all done, lets get the route's URI
    finalRoute.pathFromParams(args)