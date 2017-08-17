class Director::DirectorsController < Director::PortalController

  def new
    @user = User.new
  end

  def create
    @user= User.new(director_params)
    @user.role = "director"

    if @user.save
      puts "USER SAVED"
      @director = Director.new(
        user_id: @user.id
      )
      if @director.save
        puts "DIRECTOR SAVED"
      else
        puts "DIRECTOR NOT SAVED"
        redirect_to new_director_director_path
      end

    else
      puts "USER NOT SAVED"
      redirect_to new_director_director_path
    end

  end

  private

  def director_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
    )
  end

end
