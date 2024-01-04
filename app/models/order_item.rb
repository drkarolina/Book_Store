class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book

  validates :quantity, numericality: { greater_than_or_equal_to: Constants::MIN_BOOK_QUANTITY }
end
