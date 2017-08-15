class Director::KidsController < ApplicationController

  def index
    @kids = Kid.all.order(last_name: :desc)
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = Kid.new(kid_params)
    @parent_user_id = User.find_by(email: params[:parent_email]).id
    @parent_status = params[:parent_status]
    puts @parent_user_id

    if @kid.save
      puts "KID SAVED"
      KidsParent.create(
        user_id: @parent_user_id,
        kid_id: @kid.id,
        parent_status: @parent_status
      )
      redirect_to kid_path(:id => @kid.id)
    else
      puts "KID NOT SAVED"
      puts @kid.errors.full_messages
      redirect_to new_kid_path
    end
  end

  def show
    @kid = Kid.find(params[:id])
    @parents = @kid.users
  end

  def edit
    @kid = Kid.find(params[:id])
  end

  def update
    @kid = Kid.find(params[:id])
    @kid.update(kid_params)
  end

  def destroy
    @kid = Kid.find(params[:id])
    @kid.destroy!
    redirect_to kids_path
  end

  private

  def kid_params
    params.permit(
      :first_name,
      :last_name,
      :birthdate,
      :sin,
      :medicare
    )
  end

end
