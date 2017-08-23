class SplashController < ApplicationController

  def index
  end

  def show
    @camps = Camp.all
    addresses = @camps.map { 
      |camp| camp.address_id
    }
    @addresses = Address.find(addresses)
    @directors = User.where(role: "director").all
    puts @directors.inspect
  end
end