module Ems
  class Channel < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    def should_generate_new_friendly_id?
      new_record?
    end
        
    # Validators
    validates_uniqueness_of :slug
    validates :slug, :presence => true
    validates :name, :presence => true

    has_and_belongs_to_many :categories, :join_table => 'ems_categories_channels'
    accepts_nested_attributes_for :categories
    
    has_and_belongs_to_many :articles, :join_table => 'ems_articles_channels'
    accepts_nested_attributes_for :articles
    has_and_belongs_to_many :news, :join_table => 'ems_channels_news'
    accepts_nested_attributes_for :news
    has_and_belongs_to_many :reports, :join_table => 'ems_channels_reports'
    accepts_nested_attributes_for :reports


    #
    # @param options
    def as_json(options={})
      super( options.merge( :include => [ :categories, :articles, :reports, :news ] ) )
    end

  end
end
