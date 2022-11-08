require 'rails_helper'

RSpec.describe CheckoutController, type: :controller do
  describe 'GET /checkout' do
    context 'when user isn`t logged in' do
      before { get :index }

      it { expect(response).to have_http_status(:found) }
      it { expect(response).to redirect_to(checkout_login_path) }
    end

    context 'when user is logged in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :index
      end

      it { expect(response).to have_http_status(:ok) }
    end
  end
end
