json.array!(@inventory_details) do |inventory_detail|
  json.extract! inventory_detail, :id, :product_id, :inventory_id, :original_quality, :real_quality
  json.url inventory_detail_url(inventory_detail, format: :json)
end
