class CreateMerchantBranches < ActiveRecord::Migration
  def change
    create_table :merchant_branches do |t|
      t.belongs_to :merchant
      t.string :name

      t.timestamps
    end
  end
end
