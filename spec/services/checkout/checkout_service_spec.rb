require 'rails_helper'

RSpec.describe Checkout::CheckoutService do
  let(:user) { build(:user) }
  let(:order) { build(:order) }

  describe '#call' do
    context 'when state is address' do
      let(:params) { { step: :address } }

      it 'returns AddressPresenter' do
        expect(described_class.new(params, user, order).call.class).to be(AddressPresenter)
      end
    end
  end
end
