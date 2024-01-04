class Card < ApplicationRecord
  belongs_to :order
  validates :number, :name, :month_year, :cvv, presence: true
end
