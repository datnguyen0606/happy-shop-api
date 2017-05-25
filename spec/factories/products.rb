FactoryGirl.define do
  factory :product do
    name { Faker::Lorem.words }
    sold_out false
    category { Faker::Lorem.words }
    under_sale false
    price { Faker::Number.number(4) }
    sale_price { Faker::Number.number(4) }
  end
end
