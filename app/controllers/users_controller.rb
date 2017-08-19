class UsersController < ApplicationController

  def new
    if current_user
      redirect_to '/'
    else
      @user = User.new
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
      puts "#{@user.role} SAVED"
      session[:user_id] = @user.id
      redirect_to new_parent_parent_path
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
