class OrderDecorator < ApplicationDecorator
  delegate_all
  decorates_association :order_items

  def total_price
    order_items.sum(&:total_price).round(2)
  end
end
