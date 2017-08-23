class Director::DashboardController < Director::PortalController

  def index
    @director = Director.find_by_user_id(current_user.id)
    @camp = @director.camp
    @groups = @camp.groups

    @counselors = Counselor.all
    # @counselors = Counselor.where("id IN (select counselor_id from counselors_groups where group_id IN (select id from groups where camp_id = ?))", @camp.id)

    @kids = Kid.where("id IN (select kid_id from groups_kids where group_id IN (select id from groups where camp_id = ?))", @camp.id)
  end

end