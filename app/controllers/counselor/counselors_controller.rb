class Counselor::CounselorsController < Counselor::PortalController

  def show
    @counselor = authorize_current_counsilor
    @groups = authorize_current_counsilor.groups
  end

  def edit
    @counselor = authorize_current_counsilor
  end

  def update
    puts "GOT INTO UPDATE"
  end

end
