class CreateMerchantKiemtonReceipes < ActiveRecord::Migration
  def change
    create_table :merchant_kiemton_receipes do |t|
      t.belongs_to :merchant_warehouse
      t.string :decription

      t.timestamps
    end
  end
end
