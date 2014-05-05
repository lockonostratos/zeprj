json.array!(@imports) do |import|
  json.extract! import, :id, :warehouse_id, :merchant_account_id, :export, :description
  json.url import_url(import, format: :json)
end
