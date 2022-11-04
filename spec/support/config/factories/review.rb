FactoryBot.define do
  factory :review do
    title { FFaker::Book.title }
    text { FFaker::Lorem.paragraph }
    rating { 1 }
    status { 0 }
    created_at { Time.current }

    book
    user
  end
end
