class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :auth_token, :null => false
      t.integer :account_type, :null => false
      t.integer :parent_id, :default => 0
      t.integer :status, :default => 0
      t.string :display_name
      t.string :last_name
      t.string :first_name
      t.string :email, :null => false
      t.string :phone
      t.string :password_digest, :null => false

      t.timestamps
    end
  end
end
