class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_id, :postal_code, :prefecture, :cities, :address, :building_name, :phone_number, :token, :user, :item

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'を正しく入力してください' }
    validates :prefecture, numericality: { other_than: 1 }
    validates :cities
    validates :address
    validates :phone_number, numericality: true, length: { maximum: 11 }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture: prefecture, cities: cities, address: address, phone_number: phone_number, building_name: building_name, purchase_id: purchase.id)
  end
end
