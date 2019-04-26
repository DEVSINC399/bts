class BugsController < ApplicationController
    
    before_action :authenticate_user!
    load_and_authorize_resource
    layout 'dashboard'
    before_action :find_bug, only: [:show, :edit, :update, :destroy, :assign, :resolve, :review]
    before_action :find_project, only: [:create, :update, :edit, :new]

    def index
        @bugs = Bug.all
    end

    def new
        @bug = current_user.created_bugs.build
    end

    def create
        @bug = current_user.created_bugs.build(bug_params)
        @bug.status = 1
        if @bug.save
            redirect_to @project, notice: "Bug reported successfully."
        else
            render 'new'
        end
    end

    def edit; end

    def update
        if @bug.update(bug_params)
            redirect_to @project, notice: "Bug updated successfully."
        else
            render 'update'
        end
    end

    def destroy
        @bug.destroy
        redirect_to bugs_path, notice: "Bug deleted successfully."
    end

    def show; end

    def assign
        @bug.update_attribute(:resolved_by, current_user.id)
        @bug.update_attribute(:status, 2)
        respond_to do |format|
            format.js
        end
    end

    def resolve
        @bug.update_attribute(:status, 3)
        respond_to do |format|
            format.js
        end
    end

    def review
        @bug.update_attribute(:status, 4)
        respond_to do |format|
            format.js
        end
    end
    
    private
    def bug_params
        params.require(:bug).permit(:title, :description, :status, :bug_type, :deadline, :attachment, :project_id, :created_by, :resolved_by)
    end
    def find_bug
        @bug = Bug.find(params[:id])
    end
    def find_project
        @project = Project.find(params[:project_id])
    end
end
