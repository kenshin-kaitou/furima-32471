class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  belongs_to :category
  belongs_to :shipping_burden
  belongs_to :shipper_prefecture
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :information
    validates :image
    validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  end

  with_options numericality: { other_than: 1 } do
    validates :state_id
    validates :category_id
    validates :shipping_burden_id
    validates :shipper_prefecture_id
    validates :shipping_days_id
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
