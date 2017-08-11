class Director::CounselorsController < ApplicationController

  def index
    @counselors = Counselor.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(counselor_params)
    @user.role = "counselor"


    if @user.save
      puts "COUNSELOR USER SAVED"
      @counselor = Counselor.create(
        user_id: @user.id,
        group_id: 0,
        alias: "none",
        training: false,
        account_status: "pending"
      )
      if @counselor.save
        puts "COUNSELOR SAVED"
      end
    else
      puts "COUNSELOR NOT SAVED"
      redirect_to "/counselors/new"
    end
  end

  def edit
    @counselor = Counselor.find(params[:id])
  end

  def update
    @counselor = Counselor.find(params[:id])
    @counselor.update(update_params)
    puts "COUNSELOR UPDATED"
  end
  
  private

  def counselor_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end

    def update_params
      params.require(:counselor).permit(
        :group_id,
        :alias,
        :training,
        :account_status
      )
    end

end
