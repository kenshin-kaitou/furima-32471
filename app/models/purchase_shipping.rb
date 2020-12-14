class PurchaseShipping
	include ActiveModel::Model

	attr_accessor :user_id, :item_id,:purchase_id, :postal_code, :prefecture, :cities, :address, :building_name, :phone_number, :token, :current_user

	with_options presence: true do
		validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "「-」を含めて入力してください" }
		validates :prefecture, numericality: {other_than: 1}
		validates :cities
		validates :address
		validates :phone_number, format: {with: /\A[0-9]{10,11}\z/}
		validates :token
	end

	def save
		purchase = Purchase.create(user_id: user_id, item_id: item_id)
		Shipping.create(postal_code: postal_code, prefecture: prefecture, cities: cities, address: address, phone_number: phone_number,building_name: building_name, purchase_id:purchase.id )
	end
end
