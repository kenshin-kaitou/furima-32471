FactoryBot.define do
  factory :item do
    name {Faker::Commerce.name}
    information {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from: 2, to: 11)}
    state_id    {Faker::Number.between(from: 2, to: 7)}
    shipping_burden_id {Faker::Number.between(from: 2, to: 3)}
    shipper_prefecture_id {Faker::Number.between(from: 2, to: 48)}
    shipping_days_id {Faker::Number.between(from: 2, to: 4)}
    price       {Faker::Number.between(from: 300, to: 9999999)}
    association :user
    image {"images/item-sample.png"}
  end
end
