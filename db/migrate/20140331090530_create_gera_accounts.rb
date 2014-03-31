class CreateGeraAccounts < ActiveRecord::Migration
  def change
    create_table :gera_accounts do |t|
      t.string :display_name
      t.string :login_name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
