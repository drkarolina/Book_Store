require 'rails_helper'

RSpec.describe SettingsController, type: :controller do
  describe 'GET /settings' do
    context 'when user sign in' do
      let(:user) { create(:user) }

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
  end
end
