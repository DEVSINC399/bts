class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable, :confirmable
    has_many :user_projects
    has_many :projects, through: :user_projects
    belongs_to :role
    has_many :created_bugs, :class_name => 'Bug', :foreign_key => 'created_by'
    has_many :resolved_bugs, :class_name => 'Bug', :foreign_key => 'resolved_by'
end
