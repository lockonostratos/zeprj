json.array!(@permission_details) do |permission_detail|
  json.extract! permission_detail, :id, :permission_id, :name
  json.url permission_detail_url(permission_detail, format: :json)
end
