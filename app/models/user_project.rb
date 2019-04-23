class UserProject < ApplicationRecord
    belongs_to :user
    brlongs_to :project
end
