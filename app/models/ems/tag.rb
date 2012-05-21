module Ems
  class Tag < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged

    has_and_belongs_to_many :articles, :join_table => 'ems_articles_tags'
    accepts_nested_attributes_for :articles


    validates_uniqueness_of :slug
    validates :slug, :presence => true
    validates :title, :presence => true
    
    #
    # @param options
    def as_json(options={})
      super(options.merge(:include => [:articles]))
    end
  end
end
