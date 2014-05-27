json.array!(@areas) do |area|
  json.extract! area, :id, :merchant_id, :merchant_account_id, :name, :description
  json.url area_url(area, format: :json)
end
