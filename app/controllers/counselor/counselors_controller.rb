class Counselor::CounselorsController < Counselor::PortalController

  def show
    @counselor = User.find params[:id]
  end

  def edit
  end

  def update
  end

end
