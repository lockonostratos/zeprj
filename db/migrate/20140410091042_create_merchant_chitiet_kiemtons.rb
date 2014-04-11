class CreateMerchantChitietKiemtons < ActiveRecord::Migration
  def change
    create_table :merchant_chitiet_kiemtons do |t|
      t.belongs_to :merchant_product_chitiet
      t.belongs_to :merchant_kiemton_receipe
      t.integer :qualtity
      t.integer :qualtity_thucte

      t.timestamps
    end
  end
end
