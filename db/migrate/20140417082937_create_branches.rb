class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.belongs_to :mer
      t.string :name

      t.timestamps
    end
  end
end
