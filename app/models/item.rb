class Item < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
	belongs_to :state
	belongs_to :category
	belongs_to :shipping_burden
	belongs_to :prefecture
	belongs_to :shipping_days
	belongs_to :user
	has_one_attached :image

	validates :name, :information, :price, presence: true
	validates :uer, presence: true, foreign_key: true

	validates :state_id, :category_id, :shipping_burden_id, :prefecture_id, :shipping_days_id, numericality: { other_than: 1}
end
