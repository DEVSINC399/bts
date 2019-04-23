class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.integer :type
      t.date :deadline
      t.integer :created_by
      t.integer :resolved_by

      t.timestamps
    end

    add_index :bugs, :title, unique: true
  end
end
