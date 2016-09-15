include ActionController::HttpAuthentication::Token::ControllerMethods

module Authenticable

  # Devise methods overwrites
  def current_user
    @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated" }, status: :unauthorized unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token|
      if ApiKey.exists? access_token: token
        api = ApiKey.find_by_access_token token
        api.increment! :count
        true
      else
        false
      end
    end
  end



end
