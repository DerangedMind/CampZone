class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = "parent"

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

  def parent_role_verification

  end

  def counselor_role_verification

  end

  def director_role_verification

  end

end
