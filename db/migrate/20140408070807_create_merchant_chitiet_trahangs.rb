class CreateMerchantChitietTrahangs < ActiveRecord::Migration
  def change
    create_table :merchant_chitiet_trahangs do |t|
      t.integer :trahang_id
      t.integer :product_id
      t.integer :qualtity

      t.timestamps
    end
  end
end
