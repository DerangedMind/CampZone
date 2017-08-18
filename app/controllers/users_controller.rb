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
      flash[:notice] = "Thank you for Confirming your email! You can now enjoy using CampZone!"
      redirect_to login_path
    end
  end

  def create
    unless @user = existing_user(params[:user][:email])
      @user = User.new(user_params)
      @user.role = "parent"
    else
      flash[:alert] = "This email is already in use, please use a different email"
      redirect_to signup_path
    end

    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      flash[:notice] = "Thank you for creating an account. A confirmation email has been sent to the email you provided. Please click on the link to verify email."
      redirect_to login_path
    else
      flash[:alert] = "Oops! Something went wrong, please try again."
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
