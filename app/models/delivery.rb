class Delivery < ApplicationRecord
  has_many :orders, dependent: :nullify

  validates :min_days, numericality: { greater_than_or_equal_to: Constants::MIN_DAYS,
                                       less_than_or_equal_to: Constants::MAX_DAYS }
  validates :max_days, numericality: { greater_than: :min_days,
                                       less_than_or_equal_to: Constants::MAX_DAYS }
  validates :price, numericality: { greater_than_or_equal_to: Constants::MIN_PRICE }
  validates :min_days, :max_days, :price, :method_name, presence: true
end
