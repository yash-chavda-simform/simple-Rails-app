FactoryBot.define do
  factory :customer do
    first_name { "John" }
    last_name  { "Doe" }
    email { "john@example.com" }
    phone_no { "9191919191" }
  end

  factory :random_customer, class: Customer do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email { Faker::Internet.safe_email }
    phone_no { "9191919191" }
  end
end