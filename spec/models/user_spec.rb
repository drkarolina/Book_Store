require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_build) { build(:user) }

  describe 'datebase columns' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe 'Validations' do
    context 'when validate pass' do
      it 'is valid with valid attributes' do
        expect(user_build).to be_valid
      end
    end

    context 'when validate not pass' do
      let(:empty_value) { nil }

      it 'is not valid without an email' do
        expect(user_build).not_to allow_value(empty_value).for(:email)
      end

      it 'is not valid without a password' do
        expect(user_build).not_to allow_value(empty_value).for(:password)
      end
    end
  end
end
