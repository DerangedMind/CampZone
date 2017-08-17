class Counselor::KidsController < ApplicationController

  def show
    @kid = Kid.find(params[:id])
    @parents = @kid.parents
  end

end
