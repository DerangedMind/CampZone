class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def calculate_age(kid)
    unless kid.birthdate.nil?
      current_date = Date.today
      age = ((current_date - kid.birthdate).to_i)/365
      return age
    end
  end
  helper_method :calculate_age

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
      flash[:notice] = "Hmm... no chocolate chip cookies here!"
      redirect_to '/login'
      false
    end
  end

  def authorize_counselor
    unless counselor?
      flash[:notice] = "I knew I took a wrong turn at Albuquerque..."
      redirect_to '/login'
      false
    end
  end

  def authorize_parent
    unless parent?
      flash[:notice] = "You must have created life to access this point."
      redirect_to '/login'
      false
    end
  end
end
