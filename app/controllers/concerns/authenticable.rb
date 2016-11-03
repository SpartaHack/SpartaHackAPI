module Authenticable
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # Devise methods overwrites
  def current_user
    Rails.logger.debug "#{User.find_by(auth_token: request.headers['HTTP_USER_TOKEN'])}"
    Rails.logger.info "#{User.find_by(auth_token: request.headers['HTTP_USER_TOKEN'])}"
    @current_user ||= User.find_by(auth_token: request.headers['HTTP_USER_TOKEN'])
  end

  def authenticate_with_token!
    render json: { errors: ["Not authenticated"] }, status: :unauthorized unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token|
      if ApiKey.exists? access_token: token
        ApiKey.find_by_access_token(token).increment!(:count)
        true
      end
    end
  end

end
