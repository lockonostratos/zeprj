json.array!(@return_details) do |return_detail|
  json.extract! return_detail, :id, :return_id, :product_id, :current_quality, :return_quality
  json.url return_detail_url(return_detail, format: :json)
end
