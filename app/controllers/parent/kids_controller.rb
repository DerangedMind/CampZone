class Parent::KidsController < Parent::PortalController

  def index
    @kids = Kid.all
    # Placeholder, will be updated to only show specific parent's kids.
  end

  def show
    @kid = Kid.find_by_id(params[:id])
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = Kid.new(kid_params)
    if @kid.save
      puts "Kid created!"
    else
      puts "Kid not created."
      redirect_to 'kids/new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def kid_params
    params.require(:kid).permit(
      :first_name,
      :last_name,
      :birthdate,
      :sin,
      :medicare
    )
  end
end
