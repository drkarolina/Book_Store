require 'rails_helper'

RSpec.describe 'AddressPresenter' do
  context 'when has no addresses' do
    let(:user) { create(:user) }
    let(:presenter) { AddressPresenter.new(user: user, params: {}) }

    it { expect(presenter.billing_address.id).to be_nil }
    it { expect(presenter.shipping_address.id).to be_nil }
  end
end
