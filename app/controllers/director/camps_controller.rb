class Director::CampsController < Director::PortalController

  def show
    @director = Director.find_by_user_id(current_user.id)
    @camp = Camp.find_by_director_id(@director.id)
    @address = Address.find(@camp.address_id)
  end

  def new
    @camp = Camp.new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)

    if @address.save
      @camp = Camp.new(camp_params)
      puts current_user.id
      @camp.director_id = Director.find_by_user_id(current_user.id).id
      @camp.address_id = @address.id

      if @camp.save
        puts "CAMP CREATED"
        redirect_to director_dashboard_index_path
      else
        puts "CAMP NOT CREATED"
        @address.delete
        flash[:alert] = @camp.errors.full_messages
        redirect_to new_director_camp_path
      end

    else
      flash[:alert] = @address.errors.full_messages
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

  def address_params
    params.require(:address).permit(
      :street_address,
      :apt_number,
      :city,
      :province,
      :country,
      :postal_code
    )
  end

  def camp_params
    params.permit(
      :name,
      :phone_number
    )
  end
end

