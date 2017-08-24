class UsersController < ApplicationController

  def new_parent
    if current_user
      redirect_to_role_portal(current_user)
    else
      @user = User.new
    end
  end

  def new_director
    if current_user
      redirect_to_role_portal(current_user)
    else
      @user = User.new
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      session[:user_id] = user.id
      if user.role == "counselor"
        counselor = Counselor.find_by_user_id(user.id)
        counselor.update(:account_status => "active")
      end
      display_flash(user)
      redirect_to_role_portal(user)
    end
  end

  def create_parent
    unless @user = existing_user(params[:user][:email])
      @user = User.new(user_params)
      @user.role = "parent"
    else
      flash[:alert] = "This email is already in use, please use a different email"
      redirect_to signup_parent_path
    end

    if @user.save
      puts "USER PARENT SAVED"
      UserMailer.registration_confirmation(@user).deliver
      flash[:notice] = "Thank you for creating an account. A confirmation email has been sent to #{@user.email}. Please click on the link to verify your account."
      redirect_to login_path
    else
      puts "USER PARENT NOT SAVED"
      flash[:alert] = @parent.errors.full_messages
      redirect_to signup_parent_path
    end
  end

  def create_director
    @user= User.new(user_params)
    @user.role = "director"
    if @user.save
      puts "USER SAVED"
      @director = Director.new(
        user_id: @user.id
      )
      if @director.save
        puts "DIRECTOR SAVED"
        UserMailer.registration_confirmation(@user).deliver
        flash[:notice] = "Director Created! Please ask new director to verify email"
        redirect_to login_path
      else
        puts "DIRECTOR NOT SAVED"
        @user.destroy
        flash[:alert] = @director.errors.full_messages
        redirect_to signup_director_path
      end
    else
      puts "USER NOT SAVED"
      flash[:alert] = @user.errors.full_messages
      redirect_to signup_director_path
    end
  end

  def redirect_to_role_portal(user)
    if user.role == "parent"
      redirect_to new_parent_parent_path
    elsif user.role == "counselor"
      redirect_to counselor_settings_path
    elsif user.role == "director"
      redirect_to new_director_camp_path
    else
      raise "no role assigned"
    end
  end

  def display_flash(user)
    if user.role == "parent"
      flash[:notice] = "Thank you for confirming your email! Please fill in the information below!"
    elsif user.role == "counselor"
      flash[:notice] = "Thank you for confirming your email. Please set-up your account to continue"
    elsif user.role == "director"
      flash[:notice] = "Thank you for confirming your email! You can now enjoy using CampZone!"
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
