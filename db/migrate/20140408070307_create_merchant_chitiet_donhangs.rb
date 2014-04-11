class CreateMerchantChitietDonhangs < ActiveRecord::Migration
  def change
    create_table :merchant_chitiet_donhangs do |t|
      t.belongs_to :merchant_dondathang
      t.integer :product_code
      t.integer :skull_code
      t.integer :qualtity
      t.integer :qualtity_soluongtra
      t.integer :price
      t.integer :giamgia

      t.timestamps
    end
  end
end
