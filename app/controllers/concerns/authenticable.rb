module Authenticable
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def log_headers
    http_envs = {}.tap do |envs|
      request.headers.each do |key, value|
        envs[key] = value if key.downcase.starts_with?('http')
      end
    end

    Rails.logger.debug "Received #{request.method.inspect} to #{request.url.inspect} from #{request.remote_ip.inspect}. Processing with headers #{http_envs.inspect} and params #{params.inspect} "
    Rails.logger.debug "Header #{request.headers['X-WWW-USER-TOKEN']} "
    Rails.logger.debug "Header #{request.headers['HTTP_X_WWW_USER_TOKEN']} "
  end
  # Devise methods overwrites
  def current_user
    log_headers
    @current_user ||= User.find_by(auth_token: request.headers['X-WWW-USER-TOKEN'])
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
