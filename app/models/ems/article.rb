module Ems

  class Article < ActiveRecord::Base
    # use friendly_id to handle our slugs
    extend FriendlyId
    friendly_id :title, use: :slugged

    # after methods
    after_initialize :init

    # # Validators
    # if get 'status' === :live
    #   validates_uniqueness_of :slug
    #   validates :slug, :presence => true
    # else
    #   validates_inclusion_of :content_disposition, :in => [ :html, :markdown ], :message => "%s is not a valid content disposition"
    #   validates_inclusion_of :status, :in => [ :draft, :pending, :live ], :message => "%s is not a valid status"
    # end
    

    # relations
    belongs_to :category
    accepts_nested_attributes_for :category
    has_and_belongs_to_many :channels, :join_table => 'ems_articles_channels'
    accepts_nested_attributes_for :channels
    has_and_belongs_to_many :tags, :join_table => 'ems_articles_tags'
    accepts_nested_attributes_for :tags
    has_and_belongs_to_many :articles, :join_table => 'ems_articles_articles', :association_foreign_key => "related_id"
    # accepts_nested_attributes_for :articles
    has_and_belongs_to_many :news, :join_table => 'ems_articles_news'
    accepts_nested_attributes_for :news
    has_and_belongs_to_many :reports, :join_table => 'ems_articles_reports'
    accepts_nested_attributes_for :reports
    # paperclip files
    has_attached_file :image, :styles => { :image564x252 => "564x252#", :image312x189 => "312x189#", :image312x126 => "312x126", :image228x126 => "228x126" }


    # Method to make sure we have all our default values set on the object
    def init
      self.status ||= :draft
      self.content_disposition ||= :markdown
    end

    # Custom getter for status attribute to emulate ENUMs
    # @return [Symbol] status currently assigned to the attribute
    def status
        read_attribute(:status).to_sym if read_attribute :status
    end

    # Custom setter for status attribute to emulate ENUMs
    # @param [Symbol] value to give the status attribute
    def status= (value)
        write_attribute(:status, value.to_s)
    end

    # Custom getter for content_disposition attribute to emulate ENUMs
    # @return [Symbol] content_disposition currently assigned to the attribute
    def content_disposition
         read_attribute(:content_disposition).to_sym if read_attribute :content_disposition
    end

    # Custom setter for content_disposition attribute to emulate ENUMs
    # @param [Symbol] value to give the content_disposition attribute
    def content_disposition= (value)
     write_attribute(:content_disposition, value.to_s)
    end
    
    def content_as_html
      Kramdown::Document.new(content, :input => "BeanKramdown").to_html
    end

    #
    # @param options
    def as_json(options={})
      super( options.merge( :include => [ :category, :channels, :tags ] ) )
    end
    
    # base queries
    class << self
      
      def base_query(category=nil)
        q = self.joins(:category).where("publish_from <= :publish_from", {:publish_from => Time.now.strftime("%Y/%m/%d %H:00:00")}).where(:status => 'live')
        q = q.where('ems_categories.id' => category.id) if category
        return q
      end
    end
  end
end
