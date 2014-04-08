class CreateMerchantSkulls < ActiveRecord::Migration
  def change
    create_table :merchant_skulls do |t|
      t.string :skullcode
      t.string :description

      t.timestamps
    end
  end
end
