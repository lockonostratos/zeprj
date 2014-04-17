class Mer < ActiveRecord::Base
  has_many :branches
  has_many :mer_skulls
end
