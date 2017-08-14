class Parent::KidsController < ApplicationController

  def index
  # List of all a parent's kids.
  end

  def show
  # Details of specific kid.
  end

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

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def kid_params
    params.require(:kid).permit(
      :first_name,
      :last_name,
      :birthdate,
      :sin,
      :medicare
    )
  end
end
