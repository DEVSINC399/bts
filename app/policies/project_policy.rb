class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(scope.where(created_by: @user.try(:id)))
    end
  end

  def new? ; @user.role.name == 'Manager' || @user.role.name == 'Admin' ; end
  def create? ; @user.role.name == 'Manager' || @user.role.name == 'Admin' ; end
  def show? ; is_allowed? || @record.users.where(:id => @user.id).present? ; end
  def update? ; is_allowed? ; end
  def destroy? ; is_allowed? ; end

  private
  def is_allowed?
    @user.id == @record.created_by || @user.role.name == 'Admin'
  end

end
