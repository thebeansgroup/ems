class Ems.ArticlesController extends Batman.Controller
  articles: null

  index: (params) ->

  show: (params) ->

  new: (params) ->
    @set 'article', new Ems.Article
    # give the article the correct category
    Ems.Category.load (err, cats) =>
      throw err if err
      for cat in cats
        if(cat.get('slug') == params.category)
          @get('article').set('category', cat)

  create: (params) ->
    @get('article').save (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Ems.flashSuccess "Article #{@get('article.name')} created successfully!"

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