class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :manage, Project do |project|
        project.created_by = user.id
        can :manage, Bug, project_id: project.id
      end
    elsif user.developer?
      
    elsif user.qa?
        
    else
      # can :manage, Bug, created_by: user.id
      # can :manage, Project, created_by: user.id
      # can :read, :all
    end
  end
end
