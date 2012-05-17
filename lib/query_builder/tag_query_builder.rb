module TagQueryBuilder
    
  def build_query_from_filters(q, filters)
    filters.each do |filter, value|
      q = method("add_filter_for_#{filter}".to_sym).call(q, value)
    end
    return q
  end
    
  # Fucntion to add a like to the name
  def add_filter_for_like(q, like)
    q.where '(title LIKE ?)', "%#{like}%"
  end 
end