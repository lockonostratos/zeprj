class CreateMerchantWarehouseProducts < ActiveRecord::Migration
  def change
    create_table :merchant_warehouse_products do |t|
      t.belongs_to :merchant_warehouse
      t.string :name
      t.integer :qualtiy_all
      t.integer :price

      t.timestamps
    end
  end
end
