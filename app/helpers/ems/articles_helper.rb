module Ems
  module ArticlesHelper
    # create the form URL. Depends on whether or its an edit or a new
    def article_form_url     
      if params[:action].eql? "edit" or params[:action].eql? "update"
        return category_article_path(@article.category, @article)
      else
        return category_articles_path(@article.category)
      end
    end
    
    # Make sure we give the user only the status that is allowed with the holding roles
    def allowed_status
      status = [:draft, :pending]
      if can? :publish, @article
        status << :live
      end
      return status
    end
  end
end
