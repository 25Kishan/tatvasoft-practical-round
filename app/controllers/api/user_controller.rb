class Api::UserController < ApplicationController
  
  def register
    resource = User.new
    resource[:first_name] = 'Kishan'
    resource[:last_name] = 'Faldu'
    resource[:email] = 'kishan@gmail.com'
    resource[:password] = 'kishan123'
    resource[:phone_number] = '1234567890'
    resource.save
    render json: {message: 'success'}
  end
  def test_api
    render json: {message: 'success'}
  end
end
