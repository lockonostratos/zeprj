class CreateMerchantChitietDonhangs < ActiveRecord::Migration
  def change
    create_table :merchant_chitiet_donhangs do |t|
      t.integer :dondathang_id
      t.integer :product_code
      t.integer :qualtity
      t.integer :qualtity_soluongtra
      t.integer :price
      t.integer :giamgia

      t.timestamps
    end
  end
end
