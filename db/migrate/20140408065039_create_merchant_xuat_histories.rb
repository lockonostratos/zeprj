class CreateMerchantXuatHistories < ActiveRecord::Migration
  def change
    create_table :merchant_xuat_histories do |t|
      t.belongs_to :merchant_xuat_receipe
      t.belongs_to :merchant_product_chitiet
      t.integer :qualtity

      t.timestamps
    end
  end
end
