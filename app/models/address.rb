class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  enum address_types: { billing_address: 0, shipping_address: 1 }
end
