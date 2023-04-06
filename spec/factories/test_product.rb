FactoryBot.define do
  factory :test_product do
    product_name { "Led" }
    description { "description of product" }
    price { "49999" }
    user_rendering
  end
end
