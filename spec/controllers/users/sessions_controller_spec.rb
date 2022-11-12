require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  describe 'POST /create' do
    let(:user) { create(:user) }

    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
    end

    context 'when standart login succeeds' do
      before { post :create, params: { user: { email: user.email, password: user.password } } }

      it { expect(response).to have_http_status(:found) }
      it { expect(response).to redirect_to(root_path) }
    end

    context 'when standart login fails' do
      before { post :create, params: { user: { email: user.email, password: '' } } }

      it { expect(response).to have_http_status(:ok) }
    end

    context 'when checkout login succeeds' do
      before { post :create, params: { user: { email: user.email, password: user.password, checkout_login: true } } }

      it { expect(response).to have_http_status(:found) }
      it { expect(response).to redirect_to(checkout_index_path) }
    end

    context 'when checkout login fails' do
      before { post :create, params: { user: { email: user.email, password: '', checkout_login: true } } }

      it { expect(response).to have_http_status(:found) }
      it { expect(response).to redirect_to(checkout_index_path) }
    end
  end
end
