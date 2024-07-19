class OrderShared < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :shipping_region_id, :municipalities, :address, :building_name, :phone_number, :token

  validates :token, presence: true

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :building_name
    validates :phone_number, numericality: { only_integer: true }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shared.create(order_id: order.id, shipping_region_id: shipping_region_id, postcode: postcode, address: address, building_name: building_name, phone_number: phone_number, municipalities: municipalities,)
  end 
end
