class Director::DashboardController < Director::PortalController

def index
  @counselors = Counselor.all
  @kids = Kid.all
  @groups = Group.all
end

end
