class BugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(scope.where(created_by: @user.try(:id)))
    end
  end

  def new? ; is_project_qa? || is_project_manager? || is_admin? ; end
  def create? ; is_project_qa? || is_project_manager? ; end
  def show? ; is_project_user? || is_project_manager? || is_admin? ; end
  def update? ; is_owner? || is_admin? ; end
  def destroy? ; is_owner? || is_admin? ; end
  def assign? ; is_developer? ; end
  def resolve? ; @record.resolved_by == @user.id ; end
  def review? ; @record.created_by == @user.id ; end
  

  private
  def is_owner?
    @user.id == @record.created_by
  end
  def is_project_manager?
    @user.id == @record.project.created_by
  end
  def is_project_user?
    @record.project.users.where(id: @user.id).present?
  end
  def is_project_qa?
    is_project_user? ? @record.project.users.where(id: @user.id).first.role.name == 'QA' : false
  end
  def is_admin?
    @user.role.name == 'Admin'
  end
  def is_manager?
    @user.role.name == 'Manager'
  end
  def is_developer?
    @user.role.name == 'Developer'
  end
  def is_qa?
    @user.role.name == 'QA'
  end

end
