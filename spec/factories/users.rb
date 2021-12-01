FactoryBot.define do
  factory :user do
    name { 'Taro' }
    email { "test@user" }
    password  { "000000" }
  end
end