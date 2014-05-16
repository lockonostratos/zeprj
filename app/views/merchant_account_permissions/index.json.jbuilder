json.array!(@merchant_account_permissions) do |merchant_account_permission|
  json.extract! merchant_account_permission, :id, :merchant_account_id, :permission_id, :active
  json.url merchant_account_permission_url(merchant_account_permission, format: :json)
end
