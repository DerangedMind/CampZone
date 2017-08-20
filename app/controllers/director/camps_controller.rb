class Director::CampsController < Director::PortalController

  def index
    @camps = Camp.all
  end

  def show
    @camp = Camp.find_by_id(params[:id])
  end

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.new(camp_params)

    if @camp.save
      redirect_to director_dashboard_index_path
    else
      flash[:error] = @camp.errors.full_messages
      redirect_to new_director_camp_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def camp_params
    params.require(:camp).permit(
      :name,
      :address,
      :phone_number
    )
  end

end
