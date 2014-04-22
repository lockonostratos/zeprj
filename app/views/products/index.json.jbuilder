json.array!(@merchant_warehouse_products) do |merchant_warehouse_product|
  json.extract! merchant_warehouse_product, :id, :product_code, :skull_code, :merchant_warehouse, :name, :qualtiy_all, :price
  json.url merchant_warehouse_product_url(merchant_warehouse_product, format: :json)
end
