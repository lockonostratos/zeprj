json.array!(@product_summaries) do |product_summary|
  json.extract! product_summary, :id, :product_code, :skull_id, :warehouse_id, :name, :merchant_account_id, :quality, :price
  json.url product_summary_url(product_summary, format: :json)
end
