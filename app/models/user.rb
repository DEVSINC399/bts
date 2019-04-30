class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    attr_accessor :remember_token
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable, :confirmable
    has_many :user_projects
    has_many :projects, through: :user_projects, dependent: :destroy
    accepts_nested_attributes_for :user_projects
    belongs_to :role
    has_many :created_bugs, :class_name => 'Bug', :foreign_key => 'created_by'
    has_many :resolved_bugs, :class_name => 'Bug', :foreign_key => 'resolved_by'

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    def forget
        update_attribute(:remember_digest, nil)
    end
    def admin?
        self.role.id == 1
    end
    def manager?
        self.role.id == 2
    end
    def developer?
        self.role.id == 3
    end
    def qa?
        self.role.id == 4
    end
end
