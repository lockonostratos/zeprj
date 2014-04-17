class CreateMerSkulls < ActiveRecord::Migration
  def change
    create_table :mer_skulls do |t|
      t.belongs_to :mer
      t.string :skull_code
      t.text :description

      t.timestamps
    end
  end
end
