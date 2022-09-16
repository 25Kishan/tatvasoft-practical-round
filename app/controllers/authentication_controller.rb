class AuthenticationController < ApplicationController
  skip_before_action :authenticate, only: [:login,:register]

  # Login function based on email and password
  # Generate token using create_token function
  def login
    @user = User.find_by(email: params[:email])
    if @user
      if(@user.authenticate(params[:password]))
        payload = {user_id: @user.id }
        secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
        token = create_token(payload)
        render json:
        {
          first_name: @user.first_name
        }
      else
        render json: {message: "Authentication is failed"}
      end
    else
      render json: {message: "Unable to find user"}
    end
  end

  # def register
  #   resource = User.new
  #   resource[:first_name] = 'Kishan'
  #   resource[:last_name] = 'Faldu'
  #   resource[:email] = 'kishan@gmail.com'
  #   resource[:password] = 'kishan123'
  #   resource[:phone_number] = '1234567890'
  #   resource.save
  #   render json: {message: 'success'}
  # end
end
