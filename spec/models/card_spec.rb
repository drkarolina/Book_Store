require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:card_build) { build(:card) }

  describe 'datebase columns' do
    it { is_expected.to have_db_column(:number).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:month_year).of_type(:string) }
    it { is_expected.to have_db_column(:cvv).of_type(:string) }
    it { is_expected.to have_db_column(:order_id).of_type(:integer) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:month_year) }
    it { is_expected.to validate_presence_of(:cvv) }
  end

  describe 'Validations' do
    context 'when validate pass' do
      it 'is valid with valid attributes' do
        expect(card_build).to be_valid
      end
    end
  end
end
