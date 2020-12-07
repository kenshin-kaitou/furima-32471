class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  belongs_to :category
  belongs_to :shipping_burden
  belongs_to :shipper_prefecture
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  validates :name, :information, :image, presence: true

  validates :state_id, :category_id, :shipping_burden_id, :shipper_prefecture_id, :shipping_days_id, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
