class CreateMerchantAcounts < ActiveRecord::Migration
  def change
    create_table :merchant_acounts do |t|
      t.belongs_to :merchant
      t.float :name1 , :null => true
      t.boolean :name3 , :null => true
      t.date :name4 , :null => false
      t.text :name7 , :null => false

      t.timestamps
    end
  end
end
