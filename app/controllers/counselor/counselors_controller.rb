class Counselor::CounselorsController < ApplicationController

  def show
    @counselor = User.find params[:id]
  end

  def edit
  end

  def update
  end

end
