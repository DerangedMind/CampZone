class Counselor::CounselorsController < Counselor::PortalController

  def show
    @counselor = Counselor.find_by(user_id: current_user.id)
    @groups = @counselor.groups
  end

  def edit
    @counselor = Counselor.find_by(user_id: current_user.id)
  end

  def update
    @counselor = Counselor.find_by(user_id: current_user.id)
    @user = User.find(@counselor.user_id)

    if @counselor.update(counselor_update_params)
      if @user.update(update_password_params)
        flash[:notice] = "Information successfully updated!"
        redirect_to counselor_profile_path
      else
        flash[:alert] = @user.errors.full_messages
        redirect_to = counselor_settings_path
      end
    else
      flash[:alert] = @counselor.errors.full_messages
      redirect_to counselor_settings_path
    end
  end

  private

  def counselor_update_params
    params.require(:counselor).permit(
      :alias,
    )
  end

  def update_password_params
    params.permit(
      :password
    )
  end

end
