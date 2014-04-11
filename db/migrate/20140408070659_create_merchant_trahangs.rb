class CreateMerchantTrahangs < ActiveRecord::Migration
  def change
    create_table :merchant_trahangs do |t|
      t.belongs_to :merchant_dondathang
      t.datetime :date_trahang
      t.string :lydo

      t.timestamps
    end
  end
end
