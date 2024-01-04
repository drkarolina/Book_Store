require 'rails_helper'

RSpec.describe 'CardDecorator' do
  let(:card) do
    Card.create(number: '1234567891234567',
                name: FFaker::Name.first_name,
                month_year: FFaker::Bank.card_expiry_date,
                cvv: FFaker::PhoneNumber.exchange_code).decorate
  end

  describe 'CardDecorator#hidden_card_number' do
    it { expect(card.hidden_card_number).to eq('************4567') }
  end
end
