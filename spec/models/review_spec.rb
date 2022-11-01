require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review_build) { build(:review) }

  describe 'datebase columns' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:text).of_type(:text) }
    it { is_expected.to have_db_column(:rating).of_type(:integer) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:text) }
    it { is_expected.to validate_presence_of(:rating) }
  end

  describe 'Validations' do
    context 'when validate pass' do
      it 'is valid with valid attributes' do
        expect(review_build).to be_valid
      end
    end
  end
end
