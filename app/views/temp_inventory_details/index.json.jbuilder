json.array!(@temp_inventory_details) do |temp_inventory_detail|
  json.extract! temp_inventory_detail, :id, :product_id, :inventory, :original_quality, :real_quality, :quality
  json.url temp_inventory_detail_url(temp_inventory_detail, format: :json)
end
