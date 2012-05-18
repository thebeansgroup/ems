module Ems
  module NewsHelper
    def news_form_url
      category_news_path(@news.category, @news)
    end
  end
end
