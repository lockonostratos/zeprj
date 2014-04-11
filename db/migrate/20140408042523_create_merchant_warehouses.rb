class CreateMerchantWarehouses < ActiveRecord::Migration
  def change
    create_table :merchant_warehouses do |t|
      t.belongs_to :merchant_branche
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
