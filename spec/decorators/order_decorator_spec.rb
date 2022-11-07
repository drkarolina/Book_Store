require 'rails_helper'

RSpec.describe 'OrderDecorator' do
  let(:order_item_build) { build(:order_item) }
  let(:order_build) { build(:order) }
  let(:coupon_build) { build(:coupon) }
  let(:order) { order_build.decorate }

  before do
    OrderItem.create(quantity: 2, book_id: Book.find(1), order: order_build)
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
    it { expect(order.total_with_discount).to eq(order.total_price - order.coupon_discount) }
  end
end
