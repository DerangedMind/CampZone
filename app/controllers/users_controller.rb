class UsersController < ApplicationController

  def new
    if current_user
      redirect_to '/'
    else
      @user = User.new
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      puts "EMAIL CONFIRM PASSED!"
      redirect_to login_path
    else
      puts "EMAIL CONFIRM FAILED!"
      redirect_to login_path
    end
  end

  def create
    unless @user = existing_user(params[:user][:email])
      @user = User.new(user_params)
      @user.role = "parent"
    else
      redirect_to signup_path
    end

    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      puts "#{@user.role} SAVED"
      redirect_to login_path
    else
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end

  def existing_user(email)
    puts "the email is #{email}"
    @user = User.find_by_email(email)
  end

end
