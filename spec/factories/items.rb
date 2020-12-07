FactoryBot.define do
  factory :item do
    name { Faker::Commerce.name }
    information { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    state_id    { Faker::Number.between(from: 2, to: 7) }
    shipping_burden_id { Faker::Number.between(from: 2, to: 3) }
    shipper_prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shipping_days_id { Faker::Number.between(from: 2, to: 4) }
    price       { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item_sample.png')
    end
  end
end
