json.array!(@products) do |product|
  json.extract! product, :id, :product_code, :skull_id, :provider_id, :warehouse_id, :import_id, :name, :import_quality, :import_price, :expire
  json.url product_url(product, format: :json)
end
