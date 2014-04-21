class AddNewToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :creator_id, :integer
    add_column :accounts, :last_name, :string
    add_column :accounts, :first_name, :string
    add_column :accounts, :parent_id, :integer
  end

end
