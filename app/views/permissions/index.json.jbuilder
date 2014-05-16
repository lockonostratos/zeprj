json.array!(@permissions) do |permission|
  json.extract! permission, :id, :permission_key, :permission_name
  json.url permission_url(permission, format: :json)
end
