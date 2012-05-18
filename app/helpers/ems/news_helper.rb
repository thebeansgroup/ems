module Ems
  module NewsHelper
    def news_form_url
      if params[:action].eql? "edit"
        return category_news_path(@news.category, @news)
      else
        return category_news_index_path(@news.category)
      end
    end
  end
end
