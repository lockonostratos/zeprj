class CreateMerWarehouses < ActiveRecord::Migration
  def change
    create_table :mer_warehouses do |t|
      t.belongs_to :branche
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
