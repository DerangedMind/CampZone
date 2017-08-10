class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @parent = User.new(user_params)

    if @parent.save
      puts "USER SAVED"
    else
      redirect_to "/users/new"
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
      :password,
      :role
    )
  end

end
