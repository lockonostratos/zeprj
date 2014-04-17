class CreateMers < ActiveRecord::Migration
  def change
    create_table :mers do |t|
      t.integer :head
      t.string :name

      t.timestamps
    end
  end
end
