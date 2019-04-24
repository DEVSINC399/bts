class AddAttachmentAttachmentToBugs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :bugs do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :bugs, :attachment
  end
end
