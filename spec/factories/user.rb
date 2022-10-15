FactoryBot.define do
  factory :user do
    email { FFaker::Internet.free_email }
    password { '123qwe' }
    confirmation_token { Devise.token_generator.generate(User, :confirmation_token)[1] }
    confirmed_at { Time.now.utc }
  end
end
