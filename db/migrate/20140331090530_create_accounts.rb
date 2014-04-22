class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :auth_token, :null => false
      t.string :display_name
      t.string :email, :null => false
      t.string :phone
      t.string :password_digest, :null => false
      t.integer :account_type, :null => false

      t.timestamps
    end
  end
end
