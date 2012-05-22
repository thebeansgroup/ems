module Ems
  class Category < ActiveRecord::Base
    # use friendly_id to handle our slugs
    extend FriendlyId
    friendly_id :name, use: :slugged
    def should_generate_new_friendly_id?
      new_record?
    end

    # Validators
    validates_uniqueness_of :slug
    validates :slug, :presence => true
    validates :name, :presence => true
    validates :strapline, :presence => true

    # relations
    has_and_belongs_to_many :channels, :join_table => 'ems_categories_channels'
    accepts_nested_attributes_for :channels
    has_many :articles

    #
    # @param options
    def as_json(options={})
      super( options.merge( :include => [ :channels ] ) )
    end

  end
end
