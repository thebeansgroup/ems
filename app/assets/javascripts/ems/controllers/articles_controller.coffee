class Ems.ArticlesController extends Batman.Controller
  articles: null

  index: (params) ->

  show: (params) ->

  new: (params) ->
    @set 'article', new Ems.Article

  create: (params) ->
    @get('article').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Article #{@get('article.name')} created successfully!"
        @redirect '/articles'

  edit: (params) ->
    article = @set 'article', Ems.Article.find parseInt(params.id), (err) ->
      throw err if err

  update: ->
    @get('article').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Article #{@get('article.name')} updated successfully!"
        @redirect '/articles'