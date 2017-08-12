class Parent::ParentsController < ApplicationController

  def show
    @parent = Parent.find_by_id(params[:id])
  end

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)

    if @parent.save
      puts "Parent created!"
      # redirect_to '/parents/show'
    else
      puts "Parent not created."
      # redirect_to new_parent_path
      # redirect_to 'parents/new'
    end

  end


  def edit
  end

  def update
  end

  def destroy
  end

  private

  def parent_params
    params.require(:parent).permit(
      :user_id,
      :address,
      :phone_number
    )

end