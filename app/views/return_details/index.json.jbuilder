json.array!(@return_details) do |return_detail|
  json.extract! return_detail, :id, :return_id, :return_product_id, :return_quality, :type_return, :product_id, :price
  json.url return_detail_url(return_detail, format: :json)
end
