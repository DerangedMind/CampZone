class Director::DashboardController < Director::PortalController

def index
  @camps = Camp.all
  @counselors = Counselor.all
  @kids = Kid.all
  @groups = Group.all
end

end
