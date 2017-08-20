class SplashController < ApplicationController

  def index
    render template: "splash/#{params[:splash]}"

      redirect_to new_user_user_path

    if @user.save
      redirect_to new_director_director_path
    else
      flash[:alert].@user.errors.full_messages
    end

    if @director.save
      redirect_to new_camp_director_path
    else
      flash[:alert].@parent.errors.full_messages
    end

    if @camp.save
      redirect_to director_dashboard_index
    else
      flash[:alert].@camp.errors.full_messages
    end

  end

  def after_sign_up_path_for(resource)
  end

end
