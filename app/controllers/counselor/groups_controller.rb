class Counselor::GroupsController < ApplicationController

  def index
    @groups = Group.all.order(start_date: :desc)
  end

  def show
    @group = Group.find(params[:id])
    @counselors = @group.counselors
    @kids = @group.kids
    @camp = @group.camp
  end

end
