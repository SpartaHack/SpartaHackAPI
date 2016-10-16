module Authenticable
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # Devise methods overwrites
  def current_user
    @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
  end

  def authenticate_with_token!
    render json: { errors: ["Not authenticated"] }, status: :unauthorized unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end

  # Authenticate the user with token based authentication
  def restrict_access
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token|
      if ApiKey.exists? access_token: token
        ApiKey.find_by_access_token(token).increment!(:count)
        true
      end
    end
  end

  def render_unauthorized(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.delete('"')}")
    render json: { errors: ['Bad credentials'] }, status: :unauthorized
  end

end
