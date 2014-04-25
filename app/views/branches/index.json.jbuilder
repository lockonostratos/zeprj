json.array!(@branches) do |branch|
  json.extract! branch, :id, :merchant_id, :name
  json.url branch_url(branch, format: :json)
end
