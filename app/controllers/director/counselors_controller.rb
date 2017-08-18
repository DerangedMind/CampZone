class Director::CounselorsController < Director::PortalController

  def index
    @counselors = Counselor.all
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
      UserMailer.registration_confirmation(@user).deliver
      @counselor = Counselor.create(
        user_id: @user.id,
        alias: "none",
        training: false,
        account_status: "pending"
      )
      if @counselor.save
        puts "COUNSELOR SAVED"
        redirect_to director_counselor_path(:id => @counselor.id)
      else
        puts "COUNSELOR NOT SAVED - DESTROYING USER"
        @user.destroy!
        redirect_to new_director_counselor_path
      end
    else
      puts "User NOT SAVED"
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

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to login_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to login_path
    end
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
