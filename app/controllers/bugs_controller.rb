class BugsController < ApplicationController
    layout 'dashboard'
    before_action :find_bug, only: [:show, :edit, :update, :destroy]
    $types = { 1 => 'Bug', 2 => 'Feature', 3 => 'Change Request'}
    def index
        @bugs = Bug.all
    end
    def new
        @bug = current_user.created_bugs.build
    end
    def create
        @bug = current_user.created_bugs.build(bug_params)
        @bug.project_id = 4
        @bug.status = 1
        if @bug.save
            redirect_to bugs_path, notice: "Bug reported successfully."
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if @bug.update(bug_params)
            redirect_to bugs_path, notice: "Bug updated successfully."
        else
            render 'update'
        end
    end
    def destroy
        @bug.destroy
        redirect_to bugs_path, notice: "Bug deleted successfully."
    end
    private
        def bug_params
            params.require(:bug).permit(:title, :description, :status, :bug_type, :deadline, :project_id, :created_by, :resolved_by)
        end
        def find_bug
            @bug = Bug.find(params[:id])
        end
end
