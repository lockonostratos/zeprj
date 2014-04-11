class CreateMerchantChitietTrahangs < ActiveRecord::Migration
  def change
    create_table :merchant_chitiet_trahangs do |t|
      t.belongs_to :merchant_chitiet_trahang
      t.belongs_to :merchant_product_chitiet
      t.integer :qualtity

      t.timestamps
    end
  end
end
