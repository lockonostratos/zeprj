class CreateWarehouseProductChitiets < ActiveRecord::Migration
  def change
    create_table :warehouse_product_chitiets do |t|
      t.string :product_code
      t.integer :skull_id
      t.integer :provider_id
      t.integer :import_id
      t.integer :warehouse_id
      t.string :name
      t.integer :qualtity
      t.integer :qualtity_khadi
      t.integer :qualtity_ton
      t.integer :price

      t.timestamps
    end
  end
end
