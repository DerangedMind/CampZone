class Director::KidsController < Director::PortalController

  def index
    @kids = Kid.all.order(last_name: :desc)
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = Kid.new(kid_params)

    @parent = Parent.where("
      user_id IN (
        SELECT id FROM users
        WHERE email = ?
      )",
      params[:parent_email]
    )
    @kid.parents << @parent

    if @kid.save
      @medical_info = MedicalInfo.new(kid_medical_params)
      @medical_info.kid_id = @kid.id
      if @medical_info.save
        redirect_to director_kid_path(:id => @kid.id)
      else
        @kid.delete
        flash[:notice] = @kid_medical.errors.full_messages
        redirect_to new_director_kid_path
      end
    else
      flash[:notice] = @kid.errors.full_messages
      redirect_to new_director_kid_path
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
    if @kid.update(kid_params)
      redirect_to director_kid_path(:id => @kid.id)
    else
      flash[:error] = @kid.errors.full_messages
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
