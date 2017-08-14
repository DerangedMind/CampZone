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
    @kid = Kid.find(params[:id])
  end

  def edit
    @kid = Kid.find(params[:id])
  end

  def update
    @kid = Kid.find(params[:id])
    @kid.update(update_kid_params)
  end

  def destroy
    @kid = Kid.find(params[:id])
    @kid.destroy!
    redirect_to kids_path
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

  def update_kid_params
    params.require(:kid).permit(
      :first_name,
      :last_name,
      :birthdate,
      :sin,
      :medicare
    )
  end

end
