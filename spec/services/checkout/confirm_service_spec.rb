require 'rails_helper'

RSpec.describe Checkout::ConfirmService do
  let(:user) { build(:user) }
  let(:order) { build(:order) }

  describe 'ConfirmService#call' do
    before { described_class.new({}, user, order).call }

    it { expect(order.number).not_to be_nil }
  end
end
