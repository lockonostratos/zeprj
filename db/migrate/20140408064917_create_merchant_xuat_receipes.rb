class CreateMerchantXuatReceipes < ActiveRecord::Migration
  def change
    create_table :merchant_xuat_receipes do |t|
      t.belongs_to :merchant_warehouse
      t.integer :warehouse_id_nhan
      t.integer :create_id
      t.string :description

      t.timestamps
    end
  end
end
