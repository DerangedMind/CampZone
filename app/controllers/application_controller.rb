class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  helper_method :current_user

  def director?
    current_user && current_user.role == "director"
  end
  helper_method :director?

  def parent?
    current_user && current_user.role == "parent"
  end
  helper_method :parent?

  def counselor?
    current_user && current_user.role == "counselor"
  end
  helper_method :counselor?

  def authorize
    redirect_to '/login' unless current_user
  end

  def authorize_director
    unless director?
      flash[:error] = "Hmm... no chocolate chip cookies here!"
      redirect_to '/'
      false
    end
  end

  def authorize_counselor
    unless counselor?
      flash[:error] = "I knew I took a wrong turn at Albuquerque..."
      redirect_to '/'
      false
    end
  end
end
