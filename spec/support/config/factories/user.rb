FactoryBot.define do
  factory :user do
    id { 20 }
    email { FFaker::Internet.free_email }
    password { '123qwE' }
    password_confirmation { '123qwE' }
    confirmed_at { Time.current }
  end
end
