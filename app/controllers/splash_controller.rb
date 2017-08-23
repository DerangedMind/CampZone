class SplashController < ApplicationController

  def index
  end

  def show
    @camps = Camp.all
    addresses = @camps.map { 
      |camp| camp.address_id
    }
    @addresses = Address.find(addresses)
    @directors = User.find_by_role("director")
  end
end