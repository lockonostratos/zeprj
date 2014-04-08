class CreateMerchantDondathangs < ActiveRecord::Migration
  def change
    create_table :merchant_dondathangs do |t|
      t.integer :warehouse_id
      t.datetime :date_dat
      t.datetime :date_giao
      t.integer :create_id
      t.integer :nguoimua_id
      t.string :diachigiao
      t.string :tennguoinhan
      t.string :sdt
      t.integer :all_money
      t.integer :giamgia
      t.integer :khuyenmaitienmat
      t.integer :pttt
      t.integer :money_tratruoc
      t.integer :tinhtrangdonhang
      t.integer :trahang

      t.timestamps
    end
  end
end
