class Parent::KidsController < Parent::PortalController

  def index
    @kids = Kid.all
    # Placeholder, will be updated to only show specific parent's kids.
  end

  def show
    @kid = Kid.find_by_id(params[:id])
    @medical_info = MedicalInfo.find_by(kid_id: @kid.id)
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = Kid.new(kid_params)
    @kid_medical = MedicalInfo.new(kid_medical_params)
    @parent = Parent.find_by(user_id: current_user.id)
    current_date = Date.today
    age = ((current_date - @kid.birthdate).to_i)/365
    @group = Group.where("min_age <= ? AND max_age >= ?", age, age)

    if @kid.save
      puts "KID SAVED"
      @kid_medical.kid_id = @kid.id
      @kid_medical.save
      puts "KID MEDICAL SAVED"
      @kid.parents << @parent
      puts "KID PARENTS SAVED"
      @kid.groups << @group
      puts "KID GROUP SAVED"
      redirect_to parent_kid_path(:id => @kid.id)
    else
      puts "Kid not created."
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
