class Counselor::GroupsController < ApplicationController

  def index
    @groups = Group.all.order(start_date: :desc)
  end

  def show
    @current_group = Group.find(params[:id])
    @counselors = @current_group.counselors
    @kids = @current_group.kids
  end

end
