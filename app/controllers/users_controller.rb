class UsersController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    layout 'dashboard'
    def index
        @users = User.all
    end
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path, notice: 'User deleted successfully.'
    end
end
