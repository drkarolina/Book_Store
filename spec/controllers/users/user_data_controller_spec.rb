require 'rails_helper'

RSpec.describe Users::UserDataController, type: :controller do
  describe 'POST /create' do
    let(:user) { build(:user) }

    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
    end

    context 'when checkout login without password succeeds' do
      before { post :create, params: { user: { email: user.email, quick_register: true } } }

      it { expect(response).to have_http_status(:found) }
      it { expect(response).to redirect_to(checkout_index_path) }
    end

    context 'when checkout login without password fails' do
      before { post :create, params: { user: { email: '', quick_register: true } } }

      it { expect(response).to have_http_status(:found) }
      it { expect(response).to redirect_to(checkout_index_path) }
    end
  end
end
