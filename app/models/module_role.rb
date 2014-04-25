class ModuleRole < ActiveRecord::Base
  has_many :merchant_accounts
  belongs_to :module
  belongs_to :role
end