require 'rails_helper'

RSpec.describe CouponsService do
  let(:order) { Order.create! }
  let(:coupon) { Coupon.create!(code: FFaker::Lorem.word, discount: 1) }
  let(:invalid_params) { { code: '' } }
  let(:valid_params) { { code: coupon.code } }

  describe '#call' do
    context 'with invalid params' do
      it 'returns false' do
        expect(described_class.new(invalid_params, order).call).to be_nil
      end
    end

    context 'with valid params' do
      it 'returns true' do
        expect(described_class.new(valid_params, order).call).to be true
      end
    end
  end
end
