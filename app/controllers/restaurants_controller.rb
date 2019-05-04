class RestaurantsController < ApplicationController
  def index
    restaurants_data = RestaurantsApi.new.restaurants
    @restaurants = restaurants_data.map { |restaurant_data| Restaurant.new(restaurant_params(restaurant_data)) }

    render json: @restaurants, each_serialzer: RestaurantSerializer
  end

  def show
    record = JSON.parse(RestaurantsApi.new.restaurants)['rest'].sample
    @restaurant = Restaurant.new(name: record['name'])

    render json: @restaurant
  end

  private

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
