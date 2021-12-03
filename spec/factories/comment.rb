FactoryBot.define do
  factory :comment do
    comment { "コメント" }
    association :user, factory: :user
    association :post, factory: :post
  end
end