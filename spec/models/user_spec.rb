require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'datebase columns' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
  end

  context 'with validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end
end
