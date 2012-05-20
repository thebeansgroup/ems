module Ems
  module ArticlesHelper
    # 
    def article_form_url
      if params[:action].eql? "edit"
        return category_article_path(@article.category, @article)
      else
        return category_articles_path(@article.category)
      end
    end
    def allowed_status
      status = [:draft, :pending]
      if can? :publish, @article
        status << :live
      end
      return status
    end
  end
end
