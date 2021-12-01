FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number:10) }
    introduction { Faker::Lorem.characters(number:30) }
    user_id { "1" }
    association :user
  end

end