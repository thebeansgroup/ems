module ChannelQueryBuilder
    
  def build_query_from_filters(q, filters)
    filters.each do |filter, value|
      q = method("add_filter_for_#{filter}".to_sym).call(q, value)
    end
    return q
  end
    
  # Fucntion to add a limit to a given query
  def add_filter_for_limit(q, limit)
    q.limit(limit)
  end 
        
  def add_filter_for_category_id(q, category_id)
    q.joins(:categories).where(:ems_categories_channels => {:category_id => category_id})
  end
  
  def add_filter_for_slug(q, slug)
    q.where(:slug => slug)
  end 
  
  def add_filter_for_order_by(q, column)
    q.order column.to_sym
  end
end