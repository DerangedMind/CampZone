class User < ApplicationRecord

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    email.strip!
    email.downcase!

    @user = User.find_by_email(email)
    @user ? @user.authenticate(password) : false
  end
end
