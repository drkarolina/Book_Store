require 'rails_helper'

RSpec.describe 'OrderDecorator' do
  let(:order_item_build) { build(:order_item) }
  let(:order_build) { build(:order) }
  let(:coupon_build) { build(:coupon) }
  let(:order) { order_build.decorate }

  before do
    OrderItem.create(quantity: 2, book_id: Book.all.first, order: order_build)
    order.update(delivery: Delivery.all.first)
  end

  describe 'OrderDecorator#total_price' do
    it { expect(order.total_price).to eq(order.order_items.sum(&:total_price).round(2)) }
  end

  describe 'OrderDecorator#coupon_discount' do
    let(:result) { (order.total_price * coupon_build.discount / Constants::COUPON_DEVIDER).round(2) }

    it {
      expect(order.coupon_discount).to eq(result)
    }
  end

  describe 'OrderDecorator#total_with_discount' do
    let(:result) { (order.total_price - order.coupon_discount + order.delivery_price).round(2) }

    it {
      expect(order.total_with_discount).to eq(result)
    }
  end

  describe 'OrderDecorator#delivery_price' do
    it { expect(order.delivery_price).to eq(order.delivery.price) }
  end
end
