class MerSkull < ActiveRecord::Base
  belongs_to :mer
  has_many :warehouses
end
