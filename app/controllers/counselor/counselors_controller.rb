class Counselor::CounselorsController < Counselor::PortalController

  def show
    @counselor = User.find(current_user.id)
  end

  def edit
  end

  def update
  end

end
