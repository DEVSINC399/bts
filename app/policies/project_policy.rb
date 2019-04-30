class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(scope.where(created_by: @user.try(:id)))
    end
  end

  def new? ; is_manager? || is_admin? ; end
  def create? ; is_manager? || is_admin? ; end
  def show? ; is_allowed? || is_project_user? ; end
  def update? ; is_allowed? ; end
  def destroy? ; is_allowed? ; end

  private
  def is_allowed?
    @user.id == @record.created_by || @user.role.name == 'Admin'
  end
  def is_project_user?
    @record.users.where(:id => @user.id).present?
  end
  def is_manager?
    @user.role.name == 'Manager'
  end
  def is_admin?
    @user.role.name == 'Admin'
  end

end
