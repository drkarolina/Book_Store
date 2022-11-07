class OrderItemDecorator < ApplicationDecorator
  delegate_all
  decorates_association :book

  def total_price
    (book.price * quantity).round(2)
  end
end
