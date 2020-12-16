FactoryBot.define do
  factory :purchase_shipping do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {Faker::Address.postcode(['JA'].sample)}
    prefecture{ Faker::Number.between(from: 2, to: 48) }
    cities {Gimei.city.kanji}
    address { "1-1-1" }
    building_name { "建物名" }
    phone_number { "09012345678" }
    user_id {  }
    item_id {  }
  end
end
