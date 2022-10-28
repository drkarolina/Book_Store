require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book_build) { build(:book) }

  describe 'datebase columns' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:price).of_type(:float) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:published_at).of_type(:date) }
    it { is_expected.to have_db_column(:height).of_type(:float) }
    it { is_expected.to have_db_column(:width).of_type(:float) }
    it { is_expected.to have_db_column(:depth).of_type(:float) }
    it { is_expected.to have_db_column(:materials).of_type(:string) }
    it { is_expected.to have_db_column(:quantity).of_type(:integer) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:published_at) }
    it { is_expected.to validate_presence_of(:height) }
    it { is_expected.to validate_presence_of(:width) }
    it { is_expected.to validate_presence_of(:depth) }
    it { is_expected.to validate_presence_of(:materials) }
    it { is_expected.to validate_presence_of(:quantity) }
  end

  describe 'Validations' do
    context 'when validate pass' do
      it 'is valid with valid attributes' do
        expect(book_build).to be_valid
      end
    end
  end
end
