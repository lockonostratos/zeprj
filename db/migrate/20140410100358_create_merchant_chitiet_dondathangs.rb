class CreateMerchantChitietDondathangs < ActiveRecord::Migration
  def change
    create_table :merchant_chitiet_dondathangs do |t|
      t.belongs_to :merchant_product_chitiet
      t.belongs_to :merchant_dondathang
      t.integer :qualtity
      t.integer :price
      t.integer :giamgia
      t.string :tinhtrang

      t.timestamps
    end
  end
end
