class Parent::ParentsController < Parent::PortalController

  def show
    @parent = Parent.find_by_user_id(current_user.id)
    @kids = @parent.kids
  end

  def new
    @parent = Parent.find_by_user_id(current_user.id)
    if @parent
      redirect_to parent_profile_path
    else
      @parent = Parent.new
    end
  end

  def create
    @parent = Parent.new(parent_params)
    @parent.user_id = current_user.id

    @address = Address.new(address_params)
    @parent.address_id = @address.id

    if @parent.save
      puts "Parent created!"
      redirect_to parent_profile_path
    else
      puts "Parent not created."
      redirect_to new_parent_parent_path
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def parent_params
    params.require(:parent).permit(
      :phone_number
    )
  end

  def address_params
    params.permit(
      :city,
      :province,
      :country,
      :street_address,
      :apt_number,
      :postal_code
    )
  end
end
