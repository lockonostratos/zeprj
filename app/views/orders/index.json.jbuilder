json.array!(@orders) do |order|
  json.extract! order, :id, :branch_id, :warehouse_id, :merchant_account_id, :customer_id, :return_id, :creation_date, :delivery_date, :delivery_address, :contact_name, :contact_phone, :total_price, :deposit, :discount_cash, :final_price, :payment_method, :status
  json.url order_url(order, format: :json)
end
