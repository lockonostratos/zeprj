class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :display_name
      t.string :login_name
      t.string :email
      t.string :phone
      t.integer :status
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
