module Ems
  class Role < ActiveRecord::Base
    has_and_belongs_to_many :users, :class_name => Ems.user_class
  end
end
