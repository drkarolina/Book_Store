FactoryBot.define do
  factory :user do
    email { FFaker::Internet.free_email }
    password { '123qwE' }
    password_confirmation { '123qwE' }
  end
end
