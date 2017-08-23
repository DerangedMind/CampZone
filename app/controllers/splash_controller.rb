class SplashController < ApplicationController

  def index
  end

  def show
    @camps = Camp.find_each
  end
end