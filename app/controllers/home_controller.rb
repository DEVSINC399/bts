class HomeController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  def index
    if current_user.admin?
      @projects = Project.all
    else
      @projects = current_user.projects
    end
  end
end
