class Director::KidsController < Director::PortalController

  def index
    @kids = Kid.all.order(last_name: :desc)
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = Kid.new(kid_params)
    @medical_info = MedicalInfo.new(kid_medical_params)
    @parent_id = Parent.find_by(user_id: User.find_by(email: params[:parent_email]).id).id

    if @kid.save
      puts "KID SAVED"
      KidsParent.create(
        parent_id: @parent_id,
        kid_id: @kid.id,
      )
      @medical_info.kid_id = @kid.id
      @medical_info.save
      redirect_to kid_path(:id => @kid.id)
    else
      puts "KID NOT SAVED"
      puts @kid.errors.full_messages
      redirect_to new_kid_path
    end
  end

  def show
    @kid = Kid.find(params[:id])
    @parents = @kid.parents
    @medical_info = MedicalInfo.find_by(kid_id: @kid.id)
  end

  def edit
    @kid = Kid.find(params[:id])
  end

  def update
    @kid = Kid.find(params[:id])
    @kid.update(kid_params)
  end

  def destroy
    @kid = Kid.find(params[:id])
    @kid.destroy!
    redirect_to kids_path
  end

  private

  def kid_params
    params.permit(
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
