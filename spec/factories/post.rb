FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number:10) }
    introduction { Faker::Lorem.characters(number:30) }
    image_id { Faker::Lorem.characters(number:10) }
    video_id { Faker::Lorem.characters(number:10) }
    association :user, factory: :user
  end

end