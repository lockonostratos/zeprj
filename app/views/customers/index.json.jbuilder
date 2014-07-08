json.array!(@customers) do |customer|
  json.extract! customer, :id, :merchant_id, :merchant_account_id, :merchant_area_id, :name, :company_name, :phone, :address, :email, :sex
  json.url customer_url(customer, format: :json)
end
