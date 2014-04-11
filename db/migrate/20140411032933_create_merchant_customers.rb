class CreateMerchantCustomers < ActiveRecord::Migration
  def change
    create_table :merchant_customers do |t|
      t.belongs_to :merchant
      t.string :account_name
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
