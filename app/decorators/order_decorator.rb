class OrderDecorator < ApplicationDecorator
  delegate_all
  decorates_association :order_items

  def total_price
    order_items.sum(&:total_price).round(2)
  end

  def coupon_discount
    coupon ? (total_price * coupon.discount / Constants::COUPON_DEVIDER).round(2) : Constants::DEFAULT_DISCOUNT
  end

  def total_with_discount
    (total_price - coupon_discount + delivery_price).round(2)
  end

  def delivery_price
    delivery ? delivery.price : Constants::DEFAULT_DELIVERY_PRICE
  end
end
