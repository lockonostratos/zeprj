json.array!(@export_details) do |export_detail|
  json.extract! export_detail, :id, :export_id, :product_id, :quality
  json.url export_detail_url(export_detail, format: :json)
end
