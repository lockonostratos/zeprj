class CreateMerchantCustomerMackayProfiles < ActiveRecord::Migration
  def change
    create_table :merchant_customer_mackay_profiles do |t|
      t.belongs_to :merchant_customer
      t.string :m1_1
      t.string :m1_2
      t.string :m1_3
      t.string :m2_1

      t.timestamps
    end
  end
end
