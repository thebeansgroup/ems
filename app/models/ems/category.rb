module Ems
  class Category < ActiveRecord::Base
    # use friendly_id to handle our slugs
    extend FriendlyId
    friendly_id :name, use: :slugged

    # Validators
    validates_uniqueness_of :slug
    validates :slug, :presence => true
    validates :name, :presence => true
    validates :strapline, :presence => true

    # relations
    has_and_belongs_to_many :channels
    accepts_nested_attributes_for :channels
    has_many :articles

    #
    # @param options
    def as_json(options={})
      super( options.merge( :include => [ :channels ] ) )
    end

  end
end
