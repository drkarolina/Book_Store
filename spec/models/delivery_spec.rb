require 'rails_helper'

RSpec.describe Delivery, type: :model do
  let(:delivery_build) { build(:delivery) }

  describe 'datebase columns' do
    it { is_expected.to have_db_column(:method_name).of_type(:string) }
    it { is_expected.to have_db_column(:min_days).of_type(:integer) }
    it { is_expected.to have_db_column(:max_days).of_type(:integer) }
    it { is_expected.to have_db_column(:price).of_type(:float) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:method_name) }
    it { is_expected.to validate_presence_of(:min_days) }
    it { is_expected.to validate_presence_of(:max_days) }
    it { is_expected.to validate_presence_of(:price) }
  end

  describe 'Validations' do
    context 'when validate pass' do
      it 'is valid with valid attributes' do
        expect(delivery_build).to be_valid
      end
    end

    context 'when validation doesn`t pass' do
      it 'is not valid with valid attributes' do
        expect(described_class.create(method_name: FFaker::Lorem.word, min_days: 10, max_days: 7,
                                      price: 28.5)).not_to be_valid
      end
    end
  end
end
