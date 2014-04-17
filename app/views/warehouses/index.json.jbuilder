json.array!(@warehouses) do |warehouse|
  json.extract! warehouse, :id, :product_code, :skull_code, :merchant_warehouse, :name, :price
  json.url warehouse_url(warehouse, format: :json)
end
