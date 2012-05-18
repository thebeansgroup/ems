module Ems
  module ArticlesHelper
    def article_form_url
      if params[:action].eql? "edit"
        return category_article_path(@article.category, @article)
      else
        return category_articles_path(@article.category)
      end
    end
  end
end
