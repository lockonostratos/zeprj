class WarehouseSerializer < ActiveModel::Serializer
  attributes :id, :product_code, :skull_code, :merchant_warehouse, :name, :price
end
