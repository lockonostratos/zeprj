json.array!(@merchant_account_roles) do |merchant_account_role|
  json.extract! merchant_account_role, :id, :merchant_account_id, :role_id, :permission_text
  json.url merchant_account_role_url(merchant_account_role, format: :json)
end
