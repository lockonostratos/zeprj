json.array!(@merchants) do |merchant|
  json.extract! merchant, :id, :headquater_id, :owner_id, :name
  json.url merchant_url(merchant, format: :json)
end
