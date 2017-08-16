class Counselor::CounselorsController < Counselor::PortalController

  def show
    @counselor = authorize_current_counselor
    @groups = authorize_current_counselor.groups
  end

  def edit
    @counselor = authorize_current_counselor
  end

  def update
    puts "GOT INTO UPDATE"
  end

end
