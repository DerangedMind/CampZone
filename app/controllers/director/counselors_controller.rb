class Director::CounselorsController < Director::PortalController

  def index
    director = Director.find_by_user_id(current_user.id)
    camp = director.camp
    groups = camp.groups
    @counselors = []

    groups.each do |group|
      @counselors += group.counselors
    end
  end

  def show
    @counselor = Counselor.find(params[:id])
    @group = @counselor.groups

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = "counselor"
    @user.password = "password"

    if @user.save
      puts "USER SAVED"
      @counselor = Counselor.create(
        user_id: @user.id,
        alias: "none",
        training: false,
        account_status: "pending"
      )
      if @counselor.save
        puts "COUNSELOR SAVED"
        @group = Group.find_by(:name => params[:name])
        if @group == nil
          @counselor.destroy!
          @user.destroy!
          flash[:alert] = "Group does not exist!"
          redirect_to new_director_counselor_path
        else
        @counselor.groups << @group
        UserMailer.registration_confirmation(@user).deliver
        flash[:notice] = "Counselor created! Please ask counselor to verify email!"
        redirect_to director_counselor_path(:id => @counselor.id)
        end
      else
        puts "COUNSELOR NOT SAVED - DESTROYING USER"
        @user.destroy!
        flash[:alert] = @counselor.errors.full_messages
        redirect_to new_director_counselor_path
      end
    else
      puts "User NOT SAVED"
      flash[:alert] = @user.errors.full_messages
      redirect_to new_director_counselor_path
    end
  end

  def edit
    @counselor = Counselor.find(params[:id])
  end

  def update
    @counselor = Counselor.find(params[:id])
    @counselor.update(update_counselor_params)
    puts "COUNSELOR UPDATED"
    redirect_to director_counselor_path(:id => @counselor.id)
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end

    def update_counselor_params
      params.require(:counselor).permit(
        :group_id,
        :alias,
        :training,
        :account_status
      )
    end

end
