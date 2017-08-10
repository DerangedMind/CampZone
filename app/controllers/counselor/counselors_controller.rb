class Counselor::CounselorsController < ApplicationController

  def show
    @counselor = User.find params[:id]
  end

  def new
    @counselor = User.new
  end

  def create
  end

  def edit
  end

end
