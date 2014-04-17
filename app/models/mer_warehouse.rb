class MerWarehouse < ActiveRecord::Base
  belongs_to :branche
  has_many :warehouses
end
