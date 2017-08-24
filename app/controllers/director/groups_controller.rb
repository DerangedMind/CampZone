class Director::GroupsController < Director::PortalController

  def index
    director = Director.find_by_user_id(current_user.id)
    camp = director.camp
    @groups = camp.groups
  end

  def show
    @group = Group.find params[:id]
    @counselors = @group.counselors
    @kids = @group.kids
    @camp = @group.camp
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @director = Director.find_by(user_id: current_user.id)
    @camp = Camp.find_by_director_id(@director.id)
    @group.camp_id = @camp.id
    if @group.save
      puts "Group saved!"
      flash[:notice] = "Group Created!"
      redirect_to director_group_path(:id => @group.id)
    else
      puts "Group not saved."
      flash[:alert] = @group.errors.full_messages
      redirect_to new_director_group_path
    end

  end

  def edit
    @group = Group.find(params[:id])
    @counselors = @group.counselors
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_update_params)
      puts "GROUP UPDATED"
      flash[:notice] = "Group #{@group.name} information editted!"
      redirect_to director_group_path(:id => params[:id])
    else
      flash[:alert] = @group.errors.full_messages
      redirect_to edit_director_group_path(:id => params[:id])
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy!
    redirect_to director_groups_path
  end

  private

  def group_params
    params.require(:group).permit(
      :name,
      :min_age,
      :max_age,
      :start_date
    )
  end

    def group_update_params
      params.require(:group).permit(
      :name,
      :min_age,
      :max_age,
      :start_date
      )
  end
end
