class Order < ApplicationRecord
  include AASM

  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy
  has_one :coupon, dependent: :destroy
  has_one :card, dependent: :destroy
  belongs_to :delivery, optional: true

  enum status: { unprocessed: 0, address: 1, delivery: 2, payment: 3, confirmation: 4, complete: 5,
                 in_queue: 6, in_delivery: 7, delivered: 8, canceled: 9 }

  aasm column: :status, enum: true do
    state :unprocessed, initial: true
    state :address
    state :delivery
    state :payment
    state :confirmation
    state :complete
    state :in_queue
    state :in_delivery
    state :delivered
    state :canceled

    event :to_address do
      transitions from: :unprocessed, to: :address
    end

    event :to_delivery do
      transitions from: :address, to: :delivery
    end

    event :payment do
      transitions from: :delivery, to: :payment
    end

    event :confirmation do
      transitions from: :payment, to: :confirmation
    end

    event :complete do
      transitions from: :confirmation, to: :complete
    end
  end
end
