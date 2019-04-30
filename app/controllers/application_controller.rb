class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    rescue_from Pundit::NotAuthorizedError do
        redirect_to root_url, alert: 'You do not have access to this page'
    end

    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role_id])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role_id])
        end
end
