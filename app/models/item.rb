class Item < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
	belongs_to :state
	belongs_to :category
	belongs_to :shipping_burden
	belongs_to :shipper_prefecture
	belongs_to :shipping_days
	belongs_to :user
	has_one_attached :image
end
