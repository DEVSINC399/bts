class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :manage, Project do |project|
        project.created_by == user.id
        can :manage, Bug, project_id: project.id
      end
      cannot :assign, Bug
      cannot :resolve, Bug
    elsif user.developer?
      can :read, Project
      can :read, Bug
      can :assign, Bug, resolved_by: nil
      can :resolve, Bug
    elsif user.qa?
      can :read, Project
      can :manage, Bug do |bug|
        bug.created_by == user.id || bug.resolved_by == user.id
      end
      cannot :assign, Bug
      cannot :resolve, Bug
    else

    end
  end

  
end
