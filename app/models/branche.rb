class Branche < ActiveRecord::Base
  belongs_to :mer
  has_many :mer_warehouses
end
