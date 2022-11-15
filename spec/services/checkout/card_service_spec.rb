require 'rails_helper'

RSpec.describe Checkout::CardService do
  let(:user) { build(:user) }
  let(:order) { create(:order) }

  describe 'CardService#call' do
    context 'with valid params' do
      let(:params) do
        { card: { number: '1234123412341234',
                  name: FFaker::Name.first_name,
                  month_year: '01/09',
                  cvv: FFaker::PhoneNumber.exchange_code } }
      end

      it { expect(described_class.new(params, user, order).call).to be_truthy }
    end

    context 'with invalid params' do
      let(:params) do
        { card: { name: FFaker::Name.first_name,
                  cvv: FFaker::PhoneNumber.exchange_code } }
      end

      it { expect(described_class.new(params, user, order).call).to be_falsey }
    end
  end
end
