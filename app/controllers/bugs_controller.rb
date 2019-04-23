class BugsController < ApplicationController
    layout 'dashboard'
    before_action :find_bug, only: [:show, :edit, :update, :destroy]
    $types = ['Bug', 'Feature', 'Change Request']
    def index
        @bugs = Bug.all
    end
    def new
        @bug = Bug.new
    end
    def create
        @bug = Bug.new(bug_params)
        @bug.created_by = current_user
        @bug.status = 1
        if @bug.save
            redirect_to bugs_path
        else
            render plain: @bug.inspect
            # render 'new'
        end
    end
    def edit
    end
    def update

    end    
    private
        def bug_params
            params.require(:bug).permit(:title, :description, :status, :bug_type, :deadline, :created_by, :resolved_by)
        end
        def find_bug
            @bug = Bug.find(params[:id])
        end
end
