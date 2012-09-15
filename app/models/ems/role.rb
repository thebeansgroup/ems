module Ems
  class Role < ActiveRecord::Base
    attr_accessible :name
    has_and_belongs_to_many :users, :class_name => Ems.user_class, :join_table => 'ems_roles_users'
  end
end
