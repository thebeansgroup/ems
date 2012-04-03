module Ems
  class Report < ActiveRecord::Base
    # use friendly_id to handle our slugs
    extend FriendlyId
    friendly_id :title, use: :slugged

    # after methods
    after_initialize :init

    # Validators
    validates_uniqueness_of :slug
    validates :slug, :presence => true
    #validates_inclusion_of :status, :in => [ :draft, :pending, :live ]
    #validates_inclusion_of :content_disposition, :in => [ :html, :markdown ]

    # relations
    has_one :category
    accepts_nested_attributes_for :category
    has_and_belongs_to_many :channels, :join_table => 'ems_channels_reports'
    accepts_nested_attributes_for :channels
    has_and_belongs_to_many :tags, :join_table => 'ems_reports_tags'
    accepts_nested_attributes_for :tags
    has_and_belongs_to_many :articles, :join_table => 'ems_articles_reports'
    accepts_nested_attributes_for :articles
    has_and_belongs_to_many :news, :join_table => 'ems_news_reports'
    accepts_nested_attributes_for :news
    has_and_belongs_to_many :reports, :join_table => 'ems_reports_reports', :association_foreign_key => "related_id"
    accepts_nested_attributes_for :reports
    

    # Method to make sure we have all our default values set on the object
    def init
      self.status ||= :draft
      self.content_disposition ||= :markdown
    end
    
    #
    # @param options
    def as_json(options={})
      super( options.merge( :include => [ :channels, :tags ] ) )
    end
    
    
  end
end
