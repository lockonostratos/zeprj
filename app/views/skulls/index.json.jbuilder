json.array!(@skulls) do |skull|
  json.extract! skull, :id, :merchant_id, :merchant_account_id, :skull_code, :description
  json.url skull_url(skull, format: :json)
end
