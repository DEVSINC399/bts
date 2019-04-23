class AddProjectFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role_id, :integer
    add_column :users, :active, :integer
  end

  def self.down
    remove_columns :users, :role_id, :active
    # remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end
