class Project < ApplicationRecord
    has_many :user_projects
    has_many :users, through: :user_projects, dependent: :destroy
    belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
    accepts_nested_attributes_for :user_projects
    has_many :bugs
    validates :title, :description, :link, presence: true
end
