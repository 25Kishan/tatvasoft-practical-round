class ApplicationController < ActionController::API

  before_action :authenticate

  # Authentication function to check token in header
  def authenticate
    if request.headers["Authorization"]
      begin
        auth_header = request.headers["Authorization"]
        decoded_token = JWT.decode(token, secret)
        payload = decoded_token.first
        user_id = payload["user_id"]
        @user = User.find(user_id)
      rescue => exception
        render json: {message: "Error"}, status: :forbidden
      end
    else
      render json: {message: "Authorization token is not present in header"}, status: :forbidden
    end
  end

  # Split header token
  def token
    auth_header.split(" ")[1]
  end

  # Generate JWT token
  def create_token(payload)
    JWT.encode(payload,secret)
  end

  def secret
    secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
  end
end
