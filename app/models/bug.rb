class Bug < ApplicationRecord
    belongs_to :project
    belongs_to :creator, :class_name => 'User', :foreign_key => 'created_by'
    belongs_to :resolver, :class_name => 'User', :foreign_key => 'resolved_by'
end
