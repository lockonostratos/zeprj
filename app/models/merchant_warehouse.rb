class MerchantWarehouse < ActiveRecord::Base
  has_one :merchant_warehouses_product
end
