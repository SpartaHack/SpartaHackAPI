class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include Statistics
  include Authenticable

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password,
        :password_confirmation, :first_name, :last_name, roles: [] ])
    end
end
