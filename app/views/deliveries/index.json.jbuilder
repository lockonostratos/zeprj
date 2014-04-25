json.array!(@deliveries) do |delivery|
  json.extract! delivery, :id, :order_id, :merchant_account_id, :status, :delivery_date, :transportation_fee, :comment
  json.url delivery_url(delivery, format: :json)
end
