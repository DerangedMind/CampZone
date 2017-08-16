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
    if @kid.save
      @kid_medical.kid_id = @kid.id
      @kid_medical.save
      KidsParent.create(
        kid_id: @kid.id,
        parent_id: @parent.id
      )
      puts "Kid created!"
    else
      puts "Kid not created."
      redirect_to 'kids/new'
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
    params.permit(
      :first_name,
      :last_name,
      :birthdate,
      :sin,
      :medicare
    )
  end

  def kid_medical_params
    params.permit(
      :allergies,
      :conditions,
      :medications,
      :dietary_restrictions,
      :epi_pen
    )
  end
end
