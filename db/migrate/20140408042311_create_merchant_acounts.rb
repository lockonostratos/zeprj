class CreateMerchantAcounts < ActiveRecord::Migration
  def change
    create_table :merchant_acounts do |t|
      t.integer :role_id

      t.timestamps
    end
  end
end
