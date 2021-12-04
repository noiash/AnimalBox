FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number:10) }
    introduction { Faker::Lorem.characters(number:30) }
    image_id { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpg')) }
    association :user, factory: :user
  end

end