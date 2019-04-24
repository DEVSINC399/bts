class AddProjectIdToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :project_id, :integer
  end
  def self.down
    remove_columns :bugs, :project_id
  end
end
