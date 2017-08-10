class Director::DirectorsController < ApplicationController

  def new
    @director = User.new
  end

  def create
    raise "Request got to craete "
  end

end
