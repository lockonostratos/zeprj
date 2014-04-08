class CreateMerchantXuatHistories < ActiveRecord::Migration
  def change
    create_table :merchant_xuat_histories do |t|
      t.integer :xuat_id
      t.integer :product_id
      t.integer :qualtity

      t.timestamps
    end
  end
end
