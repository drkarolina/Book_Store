require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { create(:user) }
  let(:order) { Order.create!(user: user) }

  describe 'GET /orders' do
    context 'when user sign in' do
      before do
        sign_in(user)
        get :index
      end

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template(:index) }
    end

    context "when user don't sign in" do
      before do
        get :index
      end

      it { expect(response).to have_http_status(:found) }
      it { expect(response).to redirect_to(new_user_session_url) }
    end

    context 'with params' do
      before do
        sign_in(user)
        get :index, params: { filter_by: :in_queue }
      end

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template(:index) }
    end

    describe 'GET /orders/id' do
      before do
        sign_in(user)
        get :show, params: { id: order.id }
      end

      it { expect(response).to have_http_status(:success) }
      it { expect(response).to render_template(:show) }
    end
  end
end
