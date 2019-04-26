class ProjectsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    layout 'dashboard'
    before_action :find_projects, only: [:show, :edit, :update, :destroy]
    before_action :get_dev_qa_only, only: [:new, :edit]
    def index
        @projects = Project.all
    end
    def new
        @project = Project.new
    end
    def create
        @project = Project.new(project_params)
        @project.created_by = current_user.id
        if @project.save
            redirect_to projects_path, notice: 'Project added successfully.'
        else
            render 'create'
        end
    end
    def update
        if @project.update(project_params)
            redirect_to root_path, notice: 'Project updated successfully.'
        else
            render 'edit'
        end
    end
    def destroy
        @project.destroy
        redirect_to projects_path, notice: 'Project deleted successfully.'
    end
    def show
    end
    private
    def project_params
        params.require(:project).permit(:title, :description, :link, :created_by, user_ids: [])
    end
    def find_projects
        @project = Project.find(params[:id])
    end
    def get_dev_qa_only
        @users = User.joins("INNER JOIN roles ON users.role_id = roles.id AND (roles.id = 3 OR roles.id = 4)")
    end
end
