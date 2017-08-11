class Parent::KidsController < ApplicationController

  def new
    @kid = Kid.new
  end

  def create
    @kid = Kid.new(kid_params)

    if @kid.save
      puts "Kid created!"
    else
      puts "Kid not created."
      redirect_to 'kids/new'

    end
  end

  private

  def kid_params
    params.require(:kid).permit(
      :first_name,
      :last_name,
      :birthdate,
      :sin,
      :medicare_number
    )
  end
end
