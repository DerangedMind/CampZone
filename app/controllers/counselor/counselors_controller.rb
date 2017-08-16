class Counselor::CounselorsController < Counselor::PortalController

  def show
    puts params[:id]
    if params[:id] = Counselor.find_by(user_id: current_user.id).id
      @counselor = Counselor.find(params[:id])
      @groups = @counselor.groups
    else
      puts "Redirect to /c/groups"
    end
  end

  def edit
    if params[:id] = Counselor.find_by(user_id: current_user.id).id
      @counselor = Counselor.find(params[:id])
    else
      puts "Can't edit this counselor"
    end
  end

  def update
  end

end
