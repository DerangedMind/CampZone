class Counselor::CounselorsController < Counselor::PortalController

  def show
    @counselor = current_user
  end

  def edit
  end

  def update
  end

end
