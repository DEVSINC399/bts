class Bug < ApplicationRecord
    has_attached_file :attachment, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/
    belongs_to :project
    belongs_to :creator, :class_name => 'User', :foreign_key => 'created_by'
    has_one :resolver, :class_name => 'User', :foreign_key => 'resolved_by'
end
