require 'rails_helper'

RSpec.describe AddressService do
  let(:user) { create(:user) }
  let(:invalid_params) { { address: '', zip: '' } }

  describe '#call' do
    context 'with invalid params' do
      it 'returns false' do
        expect(described_class.new(user, invalid_params).confirm_form).to be false
      end
    end
  end
end
