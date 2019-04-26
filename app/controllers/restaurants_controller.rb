class RestaurantsController < ApplicationController
  def index
    @restaurants = JSON.parse(RestaurantsApi.new.restaurants)

    render json: @restaurants, each_serialzer: RestaurantSerializer
  end

  def show
    record = JSON.parse(RestaurantsApi.new.restaurants)['rest'].sample
    @restaurant = Restaurant.new(name: record['name'])

    render json: @restaurant
  end
end
