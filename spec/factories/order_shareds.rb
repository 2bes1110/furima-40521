FactoryBot.define do
  factory :order_shared do
    postcode { Faker::Number.between(from: 100, to: 999).to_s + "-" + Faker::Number.between(from: 1000, to: 9999).to_s }
    municipalities { Faker::Address.city }
    shipping_region_id { Faker::Number.between(from: 1, to: 47) }
    address { Faker::Address.street_address }
    token {"tok_abcdefghijk00000000000000000"}
    building_name { "ビル#{Faker::Number.number(digits: 3)}" }
    phone_number { "0" + Faker::Number.between(from: 100000000, to: 9999999999).to_s }
    
  end
end
