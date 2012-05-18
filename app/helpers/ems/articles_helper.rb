module Ems
  module ArticlesHelper
    def article_form_url
      category_article_path(@article.category, @article)
    end
  end
end
