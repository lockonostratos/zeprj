class CreateMerchantPhieugiaohangs < ActiveRecord::Migration
  def change
    create_table :merchant_phieugiaohangs do |t|
      t.integer :donhang_id
      t.datetime :date_giao
      t.integer :nguoigiao_id
      t.string :tennguoinhan
      t.string :diachi
      t.integer :all_money
      t.integer :tratruoc
      t.integer :phivanchuyen
      t.string :ghichu
      t.integer :trangthai

      t.timestamps
    end
  end
end
