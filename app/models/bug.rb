class Bug < ApplicationRecord
    belongs_to :project
    belongs_to :creator, :class_name => 'User', :foreign_key => 'created_by'
    has_one :resolver, :class_name => 'User', :foreign_key => 'resolved_by'
end
