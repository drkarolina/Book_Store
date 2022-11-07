require 'rails_helper'

RSpec.describe 'OrderDecorator' do
  let(:order_item_build) { build(:order_item) }
  let(:order_build) { build(:order) }
  let(:order) { order_build.decorate }

  before do
    OrderItem.create(quantity: 2, book_id: Book.find(1), order: order_build)
  end

  describe 'OrderDecorator#total_price' do
    it { expect(order.total_price).to eq(order.order_items.sum(&:total_price).round(2)) }
  end
end
