json.array!(@returns) do |return|
  json.extract! return, :id, :order_id, :merchant_account_id, :submited, :creation_date, :comment
  json.url return_url(return, format: :json)
end
