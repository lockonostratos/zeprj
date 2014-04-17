class Warehouse < ActiveRecord::Base
  belongs_to :mer_warehouse
  belongs_to :mer_skull
end
