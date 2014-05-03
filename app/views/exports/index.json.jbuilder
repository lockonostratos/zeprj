json.array!(@exports) do |export|
  json.extract! export, :id, :merchant_account_id, :warehouse_id, :target_warehouse_id, :export, :description
  json.url export_url(export, format: :json)
end
