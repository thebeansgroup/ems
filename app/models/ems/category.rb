module Ems
  class Category < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    # Validators
    validates_uniqueness_of :slug
    validates :slug, :presence => true
    validates :name, :presence => true
    validates :strapline, :presence => true

    has_and_belongs_to_many :channels, :foreign_key => 'category_id'

    def as_json(options = {})
      super((options || {}).merge({
          :channel_id => 1
      }))
    end
  end
end
