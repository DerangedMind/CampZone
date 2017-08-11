class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash.now[:error] = "Invalid username or password."
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  def redirect_to_role_portal(user)
    if user.role = "parent"
      redirect_to parents_path, action: "show", id: user.id
    end
  end
end
