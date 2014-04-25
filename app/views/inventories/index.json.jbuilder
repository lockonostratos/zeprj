json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :warehouse_id, :merchant_account_id, :decription, :success
  json.url inventory_url(inventory, format: :json)
end
