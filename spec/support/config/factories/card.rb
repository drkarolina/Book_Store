FactoryBot.define do
  factory :card do
    number { FFaker::Bank.card_number }
    name { FFaker::Name.first_name }
    month_year { FFaker::Bank.card_expiry_date }
    cvv { FFaker::PhoneNumber.exchange_code }

    order
  end
end
