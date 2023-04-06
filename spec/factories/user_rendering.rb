FactoryBot.define do
  factory :user_rendering do
    email { Faker::Internet.safe_email }
    password { "1234567" }
  end
end
