class Role < ActiveRecord::Base
  has_and_belongs_to_many :modules
  has_many :module_roles
end