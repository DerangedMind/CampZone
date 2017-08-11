class Director::CounselorsController < ApplicationController

  def index
    @counselors = Counselor.all
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
        redirect_to counselor_path(:id => @counselor.id)
      else
        puts "COUNSELOR NOT SAVED - DESTROYING USER"
        @user.destroy!
        redirect_to new_counselor_path
      end
    else
      puts "User NOT SAVED"
      redirect_to "/counselors/new"
    end
  end

  def edit
    @counselor = Counselor.find(params[:id])
  end

  def update
    @counselor = Counselor.find(params[:id])
    @counselor.update(update_counselor_params)
    puts "COUNSELOR UPDATED"
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
