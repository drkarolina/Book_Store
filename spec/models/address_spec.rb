require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'with associations' do
    it { is_expected.to belong_to(:addressable) }
  end
end
