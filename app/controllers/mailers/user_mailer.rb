class UserMailer < ActionMailer::Base
    default :from => "garo.assilian@gmail.com"

 def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.first_name} <#{user.email}>", :subject => "CampZone - Registration Confirmation")
 end
