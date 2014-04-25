json.array!(@products) do |product|
  json.extract! product, :id, :product_code, :skull_code, :provider, :warehouse, :import, :name, :import_quality, :import_price, :expire
  json.url product_url(product, format: :json)
end
