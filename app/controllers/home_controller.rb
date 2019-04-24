class HomeController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  def index
    if current_user.admin?
      @projects = Project.all
    elsif current_user.manager?
      @projects = Project.where(created_by: current_user)
    else
      @projects = current_user.projects
    end
  end
end
