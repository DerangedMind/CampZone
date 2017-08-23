class Parent::KidsController < Parent::PortalController

  def show
    @kid = Kid.find_by_id(params[:id])
    @medical_info = MedicalInfo.find_by(kid_id: @kid.id)
    @group = @kid.groups[0]
    @camp = Camp.find(@group.camp_id)
  end

  def new
    @kid = Kid.new
    @camps = Camp.all
  end

  def create
    @kid = Kid.new(kid_params)
    @medical_info = MedicalInfo.new(kid_medical_params)
    age = calculate_age(@kid)
    @group = Group.where("min_age <= ? AND max_age >= ? AND camp_id = ?", age, age, params[:camp])

    if @kid.save
      puts "KID SAVED"
      @medical_info.kid_id = @kid.id
      if @medical_info.save
      puts "MEDICAL INFO SAVED"
        if current_user != nil
          @kid.parents << Parent.where("user_id = ?", current_user.id)
          puts "PARENTS SAVED"
          if @group != []
            @kid.groups << @group
            puts "GROUPS SAVED"
            flash[:notice] = "Thank you for registering #{@kid.first_name}"
            redirect_to parent_kid_path(:id => @kid.id)
          else
            @kid.destroy
            @medical_info.destroy
            @kid.parents.destroy
            flash[:alert] = "This group does not exist!"
            redirect_to new_parent_kid_path
          end
        else
          @kid.destroy
          @medical_info.destroy
          flash[:alert] = "Cannot find parent account!"
          redirect_to new_parent_kid_path
        end
      else
        @kid.destroy!
        flash[:alert] = @medical_info.errors.full_messages
        redirect_to new_parent_kid_path
      end
    else
      flash[:alert] = @kid.errors.full_messages
      redirect_to new_parent_kid_path
    end

  end

  def edit
    @kid = Kid.find(params[:id])
    @medical_info = MedicalInfo.find_by_kid_id(@kid.id)
  end

  def update
    @kid = Kid.find(params[:id])
    @medical_info = MedicalInfo.find_by_kid_id(@kid.id)

    if @kid.update(kid_params)
      if @medical_info.update(kid_medical_params)
        flash[:notice] = "#{@kid.first_name}'s information has been updated!"
        redirect_to parent_kid_path(:id => params[:id])
      else
        flash[:alert] = @medical_info.errors.full_messages
        redirect_to edit_parent_kid_path(:id => params[:id])
      end
    else
      flash[:alert] = @kid.errors.full_messages
      redirect_to edit_parent_kid_path(:id => params[:id])
    end
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
