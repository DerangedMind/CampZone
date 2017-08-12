class Director::DashboardController < ApplicationController

def index
  @counselor_count = Counselor.count
  @kids_count = Kid.count
  @gorup_count = Group.count
end

end
