class User < ApplicationRecord
  # Use secure password using digest
  has_secure_password

  # Validation for unique column, length, presence 
  validates :first_name,:last_name,:email,:phone_number,:password, presence: true
  validates :phone_number,:email, uniqueness: true
  validates :phone_number, :length => {:maximum => 10}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP}
end
