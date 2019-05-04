class RestaurantSerializer < ActiveModel::Serializer
  attributes :gurunavi_id, :name, :address, :phone_number, :url, :image_url
end
