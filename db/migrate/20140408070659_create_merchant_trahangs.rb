class CreateMerchantTrahangs < ActiveRecord::Migration
  def change
    create_table :merchant_trahangs do |t|
      t.integer :dondathang_id
      t.datetime :date_trahang
      t.string :lydo

      t.timestamps
    end
  end
end
