FactoryBot.define do
  factory :coupon do
    code { FFaker::Lorem.word }
    discount { 10 }

    order
  end
end
