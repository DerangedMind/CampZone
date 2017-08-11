class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # if there is a director session
    # and we're on a certain page
    # then we're creating a counselor


    unless @user = existing_user(params[:user][:email])
      @user = User.new(user_params)
      @user.role = "parent"
    else
      redirect_to new_user_path
    end

    if @user.save
      puts "#{@user.role} SAVED"
    else
      redirect_to new_user_path
    end
  end
  
  def edit
  end

  def update
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

  def parent_role_verification

  end

  def counselor_role_verification

  end

  def director_role_verification

  end

end
