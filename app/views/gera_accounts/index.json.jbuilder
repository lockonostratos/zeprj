json.array!(@gera_accounts) do |gera_account|
  json.extract! gera_account, :id, :display_name, :login_name, :email, :password
  json.url gera_account_url(gera_account, format: :json)
end
