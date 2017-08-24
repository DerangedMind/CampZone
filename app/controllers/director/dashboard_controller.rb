class Director::DashboardController < Director::PortalController

  def index
    @director = Director.find_by_user_id(current_user.id)
    @camp = @director.camp
    @groups = @camp.groups
    @counselors = []
    @kids = []

    @groups.each do |group|
      @counselors += group.counselors
      @kids += group.kids
    end

  end
end
