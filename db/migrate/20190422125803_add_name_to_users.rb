class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
  end
  def self.down
    remove_columns :users, :name
  end
end
