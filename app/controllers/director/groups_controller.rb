class Director::GroupsController < Director::PortalController

  def index
    @groups = Group.all.order(start_date: :desc)
  end

  def show
    @group = Group.find params[:id]
    @counselors = @group.counselors
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      puts "Group saved!"
      redirect_to director_group_path(:id => @group.id)
    else
      puts "Group not saved."
      redirect_to '/groups/new'
    end

  end

  def edit
    @group = Group.find(params[:id])
    @counselors = @group.counselors
  end

  def update
    @group = Group.find(params[:id])
    @group.update!(group_update_params)
    puts "GROUP UPDATED"
    redirect_to director_group_path(:id => params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy!
    redirect_to director_groups_path
  end

  private

  def group_params
    params.require(:group).permit(
      :camp_id,
      :name,
      :min_age,
      :max_age,
      :start_date
    )
  end

    def group_update_params
      params.require(:group).permit(
      :camp_id,
      :name,
      :min_age,
      :max_age,
      :start_date
      )
  end
end
