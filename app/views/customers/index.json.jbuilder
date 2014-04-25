json.array!(@customers) do |customer|
  json.extract! customer, :id, :merchant_id, :merchant_account_id, :area_id, :account_name, :password, :email
  json.url customer_url(customer, format: :json)
end
