FactoryBot.define do
  factory :delivery do
    method_name { FFaker::Lorem.word }
    min_days { 1 }
    max_days { 2 }
    price { FFaker::Number.decimal }
  end
end
