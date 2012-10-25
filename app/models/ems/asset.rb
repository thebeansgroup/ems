module Ems
  class Asset < ActiveRecord::Base

    attr_accessible :asset

    validates_attachment :asset, :presence => true,
      :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png"] }

    belongs_to :assetable, :polymorphic => true
    # accepts_nested_attributes_for :assets

    has_attached_file :asset, :styles => {:original => "564"}

    # virtual alt text accessor - returns the title of the image otherwise the path
    def alt
      alt = self.title
      alt ||= self.image.url
    end

  end
end
