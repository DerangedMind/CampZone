class User < ApplicationRecord
  
  has_secure_password

  validates :first_name, :last_name, 
              presence: true
  validates :password,
              presence: true, length: { minimum: 8 } 
  validates :email, 
              presence: true, uniqueness: true
  before_validation :downcase_email

  def self.authenticate_with_credentials(email, password)
    email.strip!
    email.downcase!

    @user = User.find_by_email(email)
    @user ? @user.authenticate(password) : false
  end

  private

  def downcase_email
    self.email.downcase! if self.email.present?
  end
end
