class Purchase < ApplicationRecord
	belongs_to :user
	belongs_to :item
	has_one    :shipping

	attr_accessor :token
	validates :token, presence: true
end
