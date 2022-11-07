class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy

  enum status: { unprocessed: 0, processed: 1 }
end
