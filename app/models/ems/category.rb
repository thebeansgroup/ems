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
    has_and_belongs_to_many :channels, :foreign_key => 'category_id'
    has_many :articles

  end
end
