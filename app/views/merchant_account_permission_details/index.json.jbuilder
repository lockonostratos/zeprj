json.array!(@merchant_account_permission_details) do |merchant_account_permission_detail|
  json.extract! merchant_account_permission_detail, :id, :merchant_account_id, :role_id, :permission_text
  json.url merchant_account_permission_detail_url(merchant_account_permission_detail, format: :json)
end
