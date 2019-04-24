class AddCreatedByToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :created_by, :integer
  end
  def self.down
    remove_columns :projects, :created_by
  end
end
