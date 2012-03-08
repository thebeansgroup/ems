module Ems
  class Channel < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, use: :slugged
    # Validators
    validates_uniqueness_of :slug
    validates :slug, :presence => true
    validates :name, :presence => true
    has_and_belongs_to_many :categories, :foreign_key => 'channel_id'
  end
end
