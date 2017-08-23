class Parent::ParentsController < Parent::PortalController

  def show
    @parent = Parent.find_by(user_id: current_user.id)
    @kids = @parent.kids
  end

  def new
    @parent = Parent.find_by_user_id(current_user.id)
    if @parent
      redirect_to parent_profile_path
    end
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)

    if @address.save
      @parent = Parent.new(parent_params)
      @parent.user_id = current_user.id
      @parent.address_id = @address.id

      if @parent.save
        puts "Parent created!"
        redirect_to parent_profile_path
      else
        puts "Parent not created."
        @address.delete
        flash[:alert] = @parent.errors.full_messages
        redirect_to new_parent_parent_path
      end
    else
      flash[:alert] = @address.errors.full_messages
      redirect_to new_parent_parent_path
    end
  end

  def edit
    @parent = Parent.find_by_user_id(current_user.id)
    @address = @parent.address
  end

  def update
    @parent = Parent.find_by_user_id(current_user.id)
    @address = @parent.address

    if @parent.update(parent_params)
      if @address.update(address_update_params)
        flash[:notice] = "Profile has been updated!"
        redirect_to parent_profile_path
      else
        flash[:alert] = @address.errors.full_messages
        redirect_to parent_settings_path
    end
    else
      flash[:alert] = @parent.errors.full_messages
      redirect_to parent_settings_path
  end
end

  private

  def address_params
    params.require(:address).permit(
      :city,
      :province,
      :country,
      :street_address,
      :apt_number,
      :postal_code
    )
  end

  def parent_params
    params.require(:parent).permit(
      :phone_number
    )
  end

  def address_update_params
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
