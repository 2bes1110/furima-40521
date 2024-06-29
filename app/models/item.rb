class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :product_condition_id, presence: true, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_burden_id, presence: true, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :shipping_region_id, presence: true, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :days_until_shipping_id, presence: true, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_fee_burden
  belongs_to :shipping_region
  belongs_to :days_until_shipping

end

