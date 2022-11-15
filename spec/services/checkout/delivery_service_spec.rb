require 'rails_helper'

RSpec.describe Checkout::DeliveryService do
  let(:user) { build(:user) }
  let(:order) { build(:order) }

  describe 'Checkout::DeliveryService#call' do
    context 'when valid params' do
      let(:params) { { delivery_id: Delivery.all.first.id } }

      it { expect(described_class.new(params, user, order).call).to be_truthy }
    end

    context 'when invalid params' do
      it { expect(described_class.new({}, user, order).call).to be_falsey }
    end
  end
end
