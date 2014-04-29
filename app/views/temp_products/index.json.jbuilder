json.array!(@temp_products) do |temp_product|
  json.extract! temp_product, :id, :product_code, :skull_id, :provider_id, :warehouse_id, :merchant_account_id, :name, :import_quality, :import_price, :expire
  json.url temp_product_url(temp_product, format: :json)
end
