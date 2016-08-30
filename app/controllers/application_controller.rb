class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include Authenticable

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(  :email, :password, :password_confirmation , roles: [] ) }
    end
end
