class Counselor::CounselorsController < Counselor::PortalController

  def show
    @counselor = Counselor.find_by(user_id: current_user.id)
    @groups = @counselor.groups
  end

  def edit
    @counselor = Counselor.find_by(user_id: current_user.id)
  end

  def update
    puts "GOT INTO UPDATE"
  end

end
