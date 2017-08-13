class Director::DashboardController < Director::PortalController

def index
  @counselor_count = Counselor.count
  @kids_count = Kid.count
  @group_count = Group.count
end

end
