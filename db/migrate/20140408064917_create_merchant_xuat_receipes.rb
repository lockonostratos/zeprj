class CreateMerchantXuatReceipes < ActiveRecord::Migration
  def change
    create_table :merchant_xuat_receipes do |t|
      t.integer :warehouse_id_xuat
      t.integer :warehouse_id_nhan
      t.integer :create_id
      t.string :description

      t.timestamps
    end
  end
end
