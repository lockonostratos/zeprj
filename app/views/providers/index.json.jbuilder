json.array!(@providers) do |provider|
  json.extract! provider, :id, :merchant_id, :name
  json.url provider_url(provider, format: :json)
end
