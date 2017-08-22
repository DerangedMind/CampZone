class Director::KidsController < Director::PortalController

  def index
    @kids = Kid.all.order(last_name: :desc)
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = Kid.new(kid_params)
    age = calculate_age(@kid)
    @medical_info = MedicalInfo.new(kid_medical_params)
    @group = Group.where("min_age <= ? AND max_age >= ?", age, age)

    if @kid.save
      puts "KID SAVED"
      @medical_info.kid_id = @kid.id
      if @medical_info.save
      puts "MEDICAL INFO SAVED"
        if User.find_by(email: params[:parent_email]) != nil
          @kid.parents << Parent.where("user_id = ?", User.find_by(email: params[:parent_email]).id)
          puts "PARENTS SAVED"
          if @group != []
            @kid.groups << @group
            puts "GROUPS SAVED"
            redirect_to director_kid_path(:id => @kid.id)
          else
            @kid.destroy!
            @medical_info.destroy!
            @kid.parents.destroy
            flash[:alert] = "This group does not exist!"
            redirect_to new_director_kid_path
          end
        else
          @kid.destroy!
          @medical_info.destroy!
          flash[:alert] = "Cannot find parent account!"
          redirect_to new_director_kid_path
        end
      else
        @kid.destroy!
        flash[:alert] = @MedicalInfo.errors.full_messages
        redirect_to new_director_kid_path
      end
    else
      flash[:alert] = @kid.errors.full_messages
      redirect_to new_director_kid_path
    end

  end

  def show
    @kid = Kid.find(params[:id])
    @parents = @kid.parents
    @groups = @kid.groups
    @medical_info = MedicalInfo.find_by(kid_id: @kid.id)
    @counselors = @groups[0].counselors
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
        redirect_to director_kid_path(:id => @kid.id)
      else
        flash[:alert] = @medical_info.errors.full_messages
        redirect_to edit_director_kid_path(:id => @kid.id)
      end
    else
      flash[:alert] = @kid.errors.full_messages
      redirect_to edit_director_kid_path(:id => @kid.id)
    end
  end

  def destroy
    @kid = Kid.find(params[:id])
    @kid.destroy!
    redirect_to director_kids_path
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
