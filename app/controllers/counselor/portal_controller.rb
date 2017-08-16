class Counselor::PortalController < ApplicationController
  before_filter :authorize_counselor

  def authorize_current_counselor
    if params[:id] = Counselor.find_by(user_id: current_user.id).id
      Counselor.find(params[:id])
    else
      nil
      flash[:notice] = "Looks like something went wrong, try again!"
  end
end

end
