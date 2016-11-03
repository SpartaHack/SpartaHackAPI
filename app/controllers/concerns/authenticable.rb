module Authenticable
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # Devise methods overwrites
  def log_headers
    http_envs = {}.tap do |envs|
      request.headers.each do |key, value|
        envs[key] = value if key.downcase.starts_with?('http')
      end
    end

    Rails.logger.debug "Received #{request.method.inspect} to #{request.url.inspect} from #{request.remote_ip.inspect}. Processing with headers #{http_envs.inspect} and params #{params.inspect}"
  end

  def current_user
    log_headers
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
