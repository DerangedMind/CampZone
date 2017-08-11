class Director::DirectorsController < ApplicationController

  def new
    @director = User.new
  end

  def create
    @director = User.new(director_params)
    @director.role = "director"

    if @director.save
      puts "DIRECTOR SUCCESSFULLY SAVED"
    else
      puts "DIRECTOR NOT SAVED"
      redirect_to "/directors/new"
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
