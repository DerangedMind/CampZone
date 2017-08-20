class Parent::KidsController < Parent::PortalController

  def show
    @kid = Kid.find_by_id(params[:id])
    @medical_info = MedicalInfo.find_by(kid_id: @kid.id)
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = Kid.new(kid_params)
    @kid.parents << Parent.find_by_user_id(current_user.id)

    if @kid.save
      @kid_medical = MedicalInfo.new(kid_medical_params)
      @kid_medical.kid_id = @kid.id

      if @kid_medical.save
        redirect_to parent_profile_path
      else
        @kid.delete
        flash[:notice] = @kid_medical.errors.full_messages
        redirect_to new_parent_kid_path
      end
    else
      flash[:notice] = @kid.errors.full_messages
      redirect_to new_parent_kid_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def kid_params
    params.require(:kid).permit(
      :first_name,
      :last_name,
      :birthdate,
      :sin
    )
  end

  def kid_medical_params
    params.permit(
      :allergies,
      :conditions,
      :medications,
      :dietary_restrictions,
      :epi_pen,
      :medicare
    )
  end
end
