FactoryBot.define do
  factory :billing_address, class: 'Address' do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    country { FFaker::Address.country }
    phone { FFaker::PhoneNumberAU.international_phone_number }
    address_type { 0 }
    addressable_type { 'User' }
    addressable_id { 20 }
    created_at { Date.current }
    updated_at { Date.current }
  end
end

FactoryBot.define do
  factory :shipping_address, class: 'Address' do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    country { FFaker::Address.country }
    phone { FFaker::PhoneNumberAU.international_phone_number }
    address_type { 1 }
    addressable_type { 'User' }
    addressable_id { 20 }
    created_at { Date.current }
    updated_at { Date.current }
  end
end
