class Parent::ParentsController < Parent::PortalController

  def show
    @parent = Parent.find_by_user_id(current_user.id)
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
        flash[:notice] = @parent.errors.full_messages
        redirect_to new_parent_parent_path
      end
    else
      flash[:notice] = @address.errors.full_messages
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
    params.permit(
      :phone_number
    )
  end
end
