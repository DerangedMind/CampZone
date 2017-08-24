class Counselor::KidsController < ApplicationController

  def index
    counselor = Counselor.find_by_user_id(current_user.id)
    counselor_groups = counselor.groups
    camp = Camp.find(counselor_groups[0].camp_id)
    @groups = camp.groups
    @kids = []

    @groups.each do |group|
      @kids += group.kids
    end

  end

  def show
    @kid = Kid.find(params[:id])
    @medical_info = MedicalInfo.find_by_kid_id(@kid.id)
    @parents = @kid.parents
    @group = @kid.groups[0]
  end

end
