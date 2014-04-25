json.array!(@imports) do |import|
  json.extract! import, :id, :warehouse_id, :merchant_account_id, :description
  json.url import_url(import, format: :json)
end
