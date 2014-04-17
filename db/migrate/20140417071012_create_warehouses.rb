class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :product_code
      t.string :skull_code
      t.integer :merchant_warehouse
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
