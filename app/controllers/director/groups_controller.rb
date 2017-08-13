class Director::GroupsController < Director::PortalController

  def index
    @group = Group.all
  end

  def show
    @group = Group.find params[:id]
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      puts "Group saved!"
    else
      puts "Group not saved."
      redirect_to '/groups/new'
    end

  end

  def edit
  end

  def update
  end

  def delete
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
end
