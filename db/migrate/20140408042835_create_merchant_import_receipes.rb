class CreateMerchantImportReceipes < ActiveRecord::Migration
  def change
    create_table :merchant_import_receipes do |t|
      t.integer :warehouse_id_xuat
      t.string :description

      t.timestamps
    end
  end
end
