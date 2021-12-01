FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number:10) }
    introduction { Faker::Lorem.characters(number:30) }
    user_id { 1 }
    image_id { Faker::Lorem.characters(number:10) }
    video_id { Faker::Lorem.characters(number:10) }
  end

end