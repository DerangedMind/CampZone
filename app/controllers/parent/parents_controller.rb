class Parent::ParentsController < ApplicationController

  def new
  end

  def create
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

  def parent_params
    params.require(:parent).permit(
      :user_id,
      :address,
      :phone_number
    )

end