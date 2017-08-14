class Director::KidsController < ApplicationController

  def index
    @kids = Kid.all.order(first_name: :desc)
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = Kid.new(kid_params)

    if @kid.save
      puts "KID SAVED"
      redirect_to kid_path(:id => @kid.id)
    else
      puts "KID NOT SAVED"
      redirect_to new_kid_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def kid_params
    param.require(:kid).permit(
      :first_name,
      :last_name,
      :birthdate,
      :sin,
      :medicare
    )
  end



end
