# go away rubocop
class RestaurantsController < ApplicationController
  def index
    puts ' here '
    @restaurants = Restaurant.all
  end
end
