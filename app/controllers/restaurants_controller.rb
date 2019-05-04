class RestaurantsController < ApplicationController
  def index
    restaurants_data = api.restaurants
    @restaurants = restaurants_data.map { |restaurant_data| Restaurant.new(restaurant_params(restaurant_data)) }

    render json: @restaurants, each_serialzer: RestaurantSerializer
  end

  def show
    restaurant_data = api.restaurant(params[:id])
    @restaurant = Restaurant.new(restaurant_params(restaurant_data))

    render json: @restaurant
  end

  private

  def api
    @api ||= RestaurantsApi.new
  end

  def restaurant_params(restaurant_data)
    {
      gurunavi_id: restaurant_data['id'],
      name: restaurant_data['name'],
      address: restaurant_data['address'],
      phone_number: restaurant_data['tel'],
      url: restaurant_data['url'],
      image_url: restaurant_data['image_url']['shop_image1']
    }
  end
end
