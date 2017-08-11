class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    end

  end

  def destroy
  end

  def redirect_to_role_portal(user)
    if user.role = "parent"
      redirect_to parents_path, action: "show", id: user.id
    end
  end
end
