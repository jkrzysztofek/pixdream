FactoryBot.define do
  factory :user do
    sequence(:email, 1) { |n| "email#{n}@example.com" }
    password 'example'
  end
end
