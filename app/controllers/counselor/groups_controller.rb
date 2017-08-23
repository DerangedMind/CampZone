class Counselor::GroupsController < ApplicationController

  def index
    counselor = Counselor.find_by_user_id(current_user.id)
    counselor_groups = counselor.groups
    camp = Camp.find(counselor_groups[0].camp_id)
    @groups = camp.groups
  end

  def show
    @group = Group.find(params[:id])
    @counselors = @group.counselors
    @kids = @group.kids
    @camp = @group.camp
  end

end
