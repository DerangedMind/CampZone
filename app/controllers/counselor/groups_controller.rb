class Counselor::GroupsController < ApplicationController

  def show
    @current_group = Group.find(params[:id])

    @counselors = @current_group.counselors
    # All counselors assigned to this Group.

    @kids = @current_group.kids
    # All kids assigned to this Group.

  end

end