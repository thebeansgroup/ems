Batman.mixin Batman.Model, 
  findBySlug: (slug, callback) ->
    Batman.developer.assert callback, "Must call findBySlug with a callback!"
    app = window[Batman.currentApp.name]
    filter = { slug: slug }
    app[@.name].load { filters: filter }, callback
      