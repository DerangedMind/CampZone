class Director::GroupsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def delete
  end

  private

  def group_params
    params.require(:group).permit(
      :camp_id,
      :name,
      :min_age,
      :max_age,
      :startdate
    )
  end

end
