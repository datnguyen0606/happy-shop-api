FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    sold_out false
    category "makeup"
    under_sale false
    price { Faker::Number.number(4) }
    sale_price { Faker::Number.number(4) }
  end
end
