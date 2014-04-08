class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.integer :headquater
      t.string :name

      t.timestamps
    end
  end
end
