class Director::CounselorsController < ApplicationController

  def new
    @counselor = User.new
  end

  def create
    @counselor = User.new(counselor_params)
    @counselor.role = "counselor"

    if @counselor.save
      puts "COUNSELOR USER SAVED"
    else
      puts "COUNSELOR NOT SAVED"
      params.inspect
      redirect_to "/counselors/new"
    end
  end

  private

  def counselor_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end

end
