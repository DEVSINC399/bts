class HomeController < ApplicationController

  before_action :authenticate_user!
  layout 'dashboard'

  def index
    if current_user.admin?
      @projects = Project.all.order("created_at desc")
      @bugs = Bug.all.order("created_at desc")
    elsif current_user.manager?
      @projects = Project.where(created_by: current_user)
      @bugs = Bug.where(project_id: @projects.pluck(:id))
    else
      @projects = current_user.projects
      @bugs = Bug.where(project_id: @projects.pluck(:id))
    end
  end
  
end
