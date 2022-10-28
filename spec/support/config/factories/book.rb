FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    price { FFaker::Number.decimal }
    description { FFaker::Book.description }
    published_at { FFaker::Time.date }
    height { FFaker::Number.decimal }
    width { FFaker::Number.decimal }
    depth { FFaker::Number.decimal }
    materials { FFaker::Lorem.word }
    quantity { FFaker::Number.number }
  end
end
