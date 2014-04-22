json.array!(@products) do |product|
  json.extract! product, :id, :product_code, :skull_code, :merchant_warehouse, :name, :qualtiy_all, :price
  json.url product_url(product, format: :json)
end
