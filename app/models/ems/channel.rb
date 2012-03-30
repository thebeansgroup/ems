module Ems
  class Channel < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    # Validators
    validates_uniqueness_of :slug
    validates :slug, :presence => true
    validates :name, :presence => true

    has_and_belongs_to_many :categories, :join_table => 'ems_categories_channels'
    accepts_nested_attributes_for :categories
    has_and_belongs_to_many :articles, :join_table => 'ems_articles_channels'
    accepts_nested_attributes_for :articles

    #
    # @param options
    def as_json(options={})
      super( options.merge( :include => [ :categories, :articles ] ) )
    end

  end
end
