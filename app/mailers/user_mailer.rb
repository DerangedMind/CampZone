class UserMailer < ActionMailer::Base

  default :from => 'noreply.campzone@gmail.com'

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.first_name} <#{user.email}>", :subject => "Please confirm your Registration")
  end

end
