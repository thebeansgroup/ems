module Ems
  class News < ActiveRecord::Base
    # use friendly_id to handle our slugs
    extend FriendlyId
    friendly_id :title, use: :slugged
    def should_generate_new_friendly_id?
      not self.is_live?
    end

    # searchable do
    #   text :title, :stored => true
    #   text :standfirst, :stored => true
    #   text :content, :stored => true, :more_like_this => true do 
    #     Sanitize.clean self.content_as_html
    #   end
    #   integer :category_id, :references => Category
    # end

    # after methods
    after_initialize :init

    # Validators
    validates :slug, :presence => true, :if => :is_live?
    validates :category, :presence => true
    validates :channels, :presence => true, :if => :is_live?
    validates :publish_from, :presence => true, :if => :is_live?
    validates :status, :presence => true

    validates :image, :attachment_presence => true, :if => :is_live?
    validates :title, :presence => true, :if => :is_live?
    validates :standfirst, :presence => true, :if => :is_live?
    validates :content, :presence => true, :if => :is_live?

    validates_uniqueness_of :slug
    validates_inclusion_of :content_disposition, :in => [ :html, :markdown ], :message => "Value is not a valid content disposition"
    validates_inclusion_of :status, :in => [ :draft, :pending, :live ], :message => "Value is not a valid status"


    # relations
    belongs_to :category
    accepts_nested_attributes_for :category
    has_and_belongs_to_many :channels, :join_table => 'ems_channels_news'
    accepts_nested_attributes_for :channels
    has_and_belongs_to_many :tags, :join_table => 'ems_news_tags'
    accepts_nested_attributes_for :tags
    has_and_belongs_to_many :articles, :join_table => 'ems_articles_news'
    accepts_nested_attributes_for :articles
    has_and_belongs_to_many :news, :join_table => 'ems_news_news', :association_foreign_key => "related_id"
    accepts_nested_attributes_for :news
    has_and_belongs_to_many :reports, :join_table => 'ems_news_reports'
    accepts_nested_attributes_for :reports

    has_attached_file :image, :styles => { :image564x252 => "564x252#", :image312x189 => "312x189#", :image312x126 => "312x126", :image228x126 => "228x126"}

    has_many :assets, :as => :assetable
    accepts_nested_attributes_for :assets, :allow_destroy => true    

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
    def is_live?
      self.status === :live
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
