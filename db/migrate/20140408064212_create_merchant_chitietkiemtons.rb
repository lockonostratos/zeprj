class CreateMerchantChitietkiemtons < ActiveRecord::Migration
  def change
    create_table :merchant_chitietkiemtons do |t|
      t.integer :product_id
      t.integer :qualtity
      t.integer :qualtity_thucte

      t.timestamps
    end
  end
end
