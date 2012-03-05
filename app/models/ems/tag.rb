=begin

=end

module Ems
  class Tag < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged
    #validates_uniqueness_of :slug
    #validates :slug, :presence => true
    #validates :title, :presence => true
    #validates :description, :presence => true
  end
end
