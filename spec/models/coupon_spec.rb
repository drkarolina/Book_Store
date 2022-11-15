require 'rails_helper'

RSpec.describe Coupon, type: :model do
  let(:coupon_build) { build(:coupon) }

  describe 'datebase columns' do
    it { is_expected.to have_db_column(:code).of_type(:string) }
    it { is_expected.to have_db_column(:discount).of_type(:float) }
    it { is_expected.to have_db_column(:is_valid).of_type(:boolean) }
    it { is_expected.to have_db_column(:order_id).of_type(:integer) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:discount) }
  end

  describe 'Validations' do
    context 'when validation pass' do
      it 'is valid with valid attributes' do
        expect(coupon_build).to be_valid
      end
    end

    context 'when validation doesn`t pass' do
      it 'is not valid with valid attributes' do
        expect(described_class.create(discount: 10)).not_to be_valid
      end
    end
  end
end
