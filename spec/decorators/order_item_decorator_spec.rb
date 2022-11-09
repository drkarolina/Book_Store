require 'rails_helper'

RSpec.describe 'OrderItemDecorator' do
  let(:order_item_build) { build(:order_item) }
  let(:order_item) { order_item_build.decorate }

  describe 'OrderItemDecorator#total_price' do
    it { expect(order_item.total_price).to eq((order_item.book.price * order_item.quantity).round(2)) }
  end
end
