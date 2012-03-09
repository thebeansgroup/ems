module Ems

  class Article < ActiveRecord::Base
    # use friendly_id to handle our slugs
    extend FriendlyId
    friendly_id :title, use: :slugged

    # before methods
    before_validation :default_values
    before_save :default_values

    # Validators
    validates_uniqueness_of :slug
    validates :slug, :presence => true
    validates_inclusion_of :status, :in => [ :draft, :pending, :live ]
    validates_inclusion_of :content_disposition, :in => [ :html, :markdown ]

    # relations
    has_one :category

    # Method to make sure we have all our default values set on the object
    def default_values
      self.status ||= :draft
      self.content_disposition ||= :markdown
    end

    # Custom getter for status attribute to emulate ENUMs
    # @return [Symbol] status currently assigned to the attribute
    def status
      read_attribute(:status).to_sym
    end

    # Custom setter for status attribute to emulate ENUMs
    # @param [Symbol] value to give the status attribute
    def status= (value)
      write_attribute(:status, value.to_s)
    end

    # Custom getter for content_disposition attribute to emulate ENUMs
    # @return [Symbol] content_disposition currently assigned to the attribute
    def content_disposition
      #read_attribute(:content_disposition)
      #read_attribute(:content_disposition).to_sym
    end

    # Custom setter for content_disposition attribute to emulate ENUMs
    # @param [Symbol] value to give the content_disposition attribute
    def content_disposition= (value)
      write_attribute(:content_disposition, value.to_s)
    end

  end
end
