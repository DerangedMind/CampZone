class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      puts "Login SUCCESS"
      session[:user_id] = @user.id
      redirect_to_role_portal @user
    else
      puts "Login FAILED"
      flash.now[:error] = "Invalid username or password."
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  def redirect_to_role_portal(user)
    if user.role == "parent"
      redirect_to parent_profile_path
    elsif user.role == "counselor"
      redirect_to counselor_profile_path
    elsif user.role == "director"
      redirect_to director_dashboard_index_path
    else
      raise "no role assigned"
    end
  end
end
