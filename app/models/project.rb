class Project < ApplicationRecord
    has_many :user_projects
    has_many :users, through: :user_projects, dependent: :destroy
    accepts_nested_attributes_for :user_projects
    has_many :bugs
    validates :title, :description, :link, presence: true
end
