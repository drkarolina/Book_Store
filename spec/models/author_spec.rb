require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author_build) { build(:author) }

  describe 'datebase columns' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe 'Validations' do
    context 'when validate pass' do
      it 'is valid with valid attributes' do
        expect(author_build).to be_valid
      end
    end
  end
end
