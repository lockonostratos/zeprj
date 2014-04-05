class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :auth_token
      t.string :display_name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.integer :status

      t.timestamps
    end
  end
end
