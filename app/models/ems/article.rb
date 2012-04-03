module Ems

  class Article < ActiveRecord::Base
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
    has_and_belongs_to_many :channels, :join_table => 'ems_articles_channels'
    accepts_nested_attributes_for :channels
    has_and_belongs_to_many :tags, :join_table => 'ems_articles_tags'
    accepts_nested_attributes_for :tags
    has_and_belongs_to_many :articles, :join_table => 'ems_articles_articles'
    accepts_nested_attributes_for :articles
    has_and_belongs_to_many :news, :join_table => 'ems_articles_news'
    accepts_nested_attributes_for :news
    has_and_belongs_to_many :reports, :join_table => 'ems_articles_reports'
    accepts_nested_attributes_for :reports
    

    # Method to make sure we have all our default values set on the object
    def init
      self.status ||= :draft
      self.content_disposition ||= :markdown
    end

    # Custom getter for status attribute to emulate ENUMs
    # @return [Symbol] status currently assigned to the attribute
    #def status
    #  read_attribute(:status).to_sym
    #end

    # Custom setter for status attribute to emulate ENUMs
    # @param [Symbol] value to give the status attribute
    #def status= (value)
    #  write_attribute(:status, value.to_s)
    #end

    # Custom getter for content_disposition attribute to emulate ENUMs
    # @return [Symbol] content_disposition currently assigned to the attribute
    #def content_disposition
    #  read_attribute(:content_disposition)
    #  read_attribute(:content_disposition).to_sym
    #end

    # Custom setter for content_disposition attribute to emulate ENUMs
    # @param [Symbol] value to give the content_disposition attribute
    #def content_disposition= (value)
    #  write_attribute(:content_disposition, value.to_s)
    #end

    #
    # @param options
    def as_json(options={})
      super( options.merge( :include => [ :channels, :tags ] ) )
    end

  end
end
