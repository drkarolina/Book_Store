class Coupon < ApplicationRecord
  belongs_to :order, optional: true

  validates :code, :discount, presence: true
  validates :discount, numericality: { greater_than_or_equal_to: Constants::MIN_DISCOUNT,
                                       less_than_or_equal_to: Constants::MAX_DISCOUNT }
end
