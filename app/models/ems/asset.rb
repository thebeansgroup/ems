module Ems
  class Asset < ActiveRecord::Base
    
    validates_attachment :asset, :presence => true,
      :content_type => { :content_type => ["image/jpg", "image/jpeg"] }
          
    belongs_to :assetable, :polymorphic => true
    
    has_attached_file :asset, :styles => {:original => "564x252>"}.merge(PAPERCLIP_STORAGE_OPTIONS)
    
    # virtual alt text accessor - returns the title of the image otherwise the path
    def alt
      alt = self.title 
      alt ||= self.image.url
    end
  end
end
