class CreateWarehouseProductChitiets < ActiveRecord::Migration
  def change
    create_table :warehouse_product_chitiets do |t|
      t.string :product_code
      t.belongs_to :merchant_skull
      t.belongs_to :merchant_provider
      t.belongs_to :merchant_import_receipe
      t.belongs_to :merchant_warehouses
      t.string :name
      t.integer :qualtity
      t.integer :qualtity_khadi
      t.integer :qualtity_ton
      t.integer :price

      t.timestamps
    end
  end
end
