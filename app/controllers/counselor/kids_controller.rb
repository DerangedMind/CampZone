class Counselor::KidsController < ApplicationController

  def index
    @kids = Kid.all

  end

  def show
    @kid = Kid.find(params[:id])
    @parents = @kid.parents
    @group = @kid.groups[0]
  end

end
