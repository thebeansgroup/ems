module Ems
  class News < ActiveRecord::Base
    # use friendly_id to handle our slugs
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    searchable do
      text :title, :stored => true
      text :standfirst, :stored => true
      text :content, :stored => true, :more_like_this => true do 
        sanitize self.content_as_html.gsub(/(\n|\r)/, "")
      end
      integer :category_id, :references => Category
    end

    # after methods
    after_initialize :init

    # Validators
    validates_uniqueness_of :slug
    validates :slug, :presence => true
    #validates_inclusion_of :status, :in => [ :draft, :pending, :live ]
    #validates_inclusion_of :content_disposition, :in => [ :html, :markdown ]

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
    
    has_attached_file :image, :styles => { :image228x126 => "228x126" }
    

    # Method to make sure we have all our default values set on the object
    def init
      self.status ||= :draft
      self.content_disposition ||= :markdown
    end
    
    def content_as_html
      Kramdown::Document.new(content, :input => "BeanKramdown").to_html
    end
    
    #
    # @param options
    def as_json(options={})
      super( options.merge( :include => [ :channels, :tags ] ) )
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
